<?php
namespace App\Traits;

use Illuminate\Http\Request;

trait UploadLarageFile{
    public function upload_larage_file(Request $request, $filepath) {
        $input = $request->all();

        // THE UPLOAD DESTINATION - CHANGE THIS TO YOUR OWN
        $filePath = public_path($filepath);

        if (!file_exists($filePath)) {
            if (!mkdir($filePath, 0777, true)) {
                return response()->json(["ok" => 0, "info" => "Failed to create $filePath"]);
            }
        }

        $fileName = isset($_REQUEST["name"]) ? $_REQUEST["name"] : $_FILES["file"]["name"];
        $filePathWithSeparator = $filePath . DIRECTORY_SEPARATOR;

        // DEAL WITH CHUNKS
        $chunk = isset($_REQUEST["chunk"]) ? intval($_REQUEST["chunk"]) : 0;
        $chunks = isset($_REQUEST["chunks"]) ? intval($_REQUEST["chunks"]) : 0;
        $out = fopen("{$filePathWithSeparator}{$fileName}.part", $chunk == 0 ? "wb" : "ab");

        if ($out) {
            $in = fopen($_FILES['file']['tmp_name'], "rb");

            if ($in) {
                while ($buff = fread($in, 4096)) {
                    fwrite($out, $buff);
                }
            } else {
                return response()->json(["ok" => 0, "info" => 'Failed to open input stream']);
            }

            fclose($in);
            fclose($out);
            unlink($_FILES['file']['tmp_name']);
        }

        // CHECK IF FILE HAS BEEN UPLOADED
        if (!$chunks || $chunk == $chunks - 1) {
            $fileExtension = pathinfo($fileName, PATHINFO_EXTENSION);
            $randomFileName = uniqid() . '_' . mt_rand() . '.' . $fileExtension;
            $finalFilePath = $filePathWithSeparator . $randomFileName;

            rename("{$filePathWithSeparator}{$fileName}.part", $finalFilePath);
            $array = ['file' => $randomFileName];
        }

        $info = "Upload OK";
        $ok = 1;

        $data["ok"] = $ok;
        $data["info"] = $info;
        $data["fileName"] = $randomFileName;
        return $data;
    }

}
