<?php
namespace App\Traits;

use Illuminate\Http\Request;

trait UploadLarageFile{
    public function upload_larage_file(Request $request,$filepath){
        $_REQUEST["name"];
        $input = $request->all();

        // THE UPLOAD DESITINATION - CHANGE THIS TO YOUR OWN
        $filePath = public_path($filepath);

        if (!file_exists($filePath)) {
            if (!mkdir($filePath, 0777, true)) {
                return response()->json(["ok"=>0, "info"=>"Failed to create $filePath"]);
            }
        }

        $fileName = isset($_REQUEST["name"]) ? $_REQUEST["name"] : $_FILES["file"]["name"];
        $filePath = $filePath . DIRECTORY_SEPARATOR . $fileName;

        // DEAL WITH CHUNKS
        $chunk = isset($_REQUEST["chunk"]) ? intval($_REQUEST["chunk"]) : 0;
        $chunks = isset($_REQUEST["chunks"]) ? intval($_REQUEST["chunks"]) : 0;
        $out = fopen("{$filePath}.part", $chunk == 0 ? "wb" : "ab");

        if ($out) {
            $in = fopen($_FILES['file']['tmp_name'], "rb");

            if ($in) {
                while ($buff = fread($in, 4096)) { fwrite($out, $buff); }
            } else {
                return response()->json(["ok"=>0, "info"=>'Failed to open input stream']);
            }

            fclose($in);
            fclose($out);
            unlink($_FILES['file']['tmp_name']);
        }

        // CHECK IF FILE HAS BEEN UPLOADED

        if (!$chunks || $chunk == $chunks - 1) {
            rename("{$filePath}.part", $filePath);
            $array = ['file' => $fileName];
        }

        $info = "Upload OK";
        $ok =1;

        $data["ok"]=$ok;
        $data["info"]=$info;
        $data["fileName"]=$fileName;
        return $data;
    }
}
