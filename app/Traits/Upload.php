<?php
namespace App\Traits;

use Illuminate\Http\Request;
/**
 * Trait to image upload
 */
trait Upload
{
    public function image_upload($request,$folder,$img="img")
    {
        $file=$request->file($img);
        $imagename=$request->file($img)->getClientOriginalName();
        $extension = $file->getClientOriginalExtension();
        $file=$request->file($img)->storeAs($folder,"{$folder}_" . uniqid() . "." . $extension,$folder); // take a parameters to make name for image

        return $file;
    }

    public function pdf_upload($request,$folder,$name="pdf"){
        $file=$request->file($name);
        $filename=$request->file($name)->getClientOriginalName();
        $extension = $file->getClientOriginalExtension();

        $file=$request->file($name)->storeAs($folder,uniqid() . "." . $extension,'books'); // take a parameters to make name for image

        return $file;
    }
}

