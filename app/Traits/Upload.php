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
        $imagename=$request->file($img)->getClientOriginalName();
        $file=$request->file($img)->storeAs($folder,$imagename,$folder); // take a parameters to make name for image

        return $file;
    }

    public function pdf_upload($request,$folder,$name="pdf"){
        $filename=$request->file($name)->getClientOriginalName();
        $file=$request->file($name)->storeAs($folder,$filename,'books'); // take a parameters to make name for image

        return $file;
    }
}

