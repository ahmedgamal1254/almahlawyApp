<?php
namespace App\Http\Controllers;

use App\Models\Profile;
use App\Models\ProfileTeacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Traits\Upload;

class ProfileTeacherController extends Controller
{
    use Upload;
    // Show the form for editing the specified resource.
    public function edit()
    {
        $profile=ProfileTeacher::where("teacher_id",Auth::guard('teacher')->user()->id)->first();

        return view('Teacher.profile.edit', compact('profile'));
    }

    // Update the specified resource in storage.
    public function update(Request $request)
    {
        $file='';

        if($request->hasFile("img")){
           $file=$this->image_upload($request,"teachers");
        }

        $request->validate([
            'phonenumber' => 'nullable|string',
            'whatsapp' => 'nullable|string',
            'bio' => 'nullable|string',
            'facebook' => 'nullable|string',
            'youtube' => 'nullable|string',
            'instagram' => 'nullable|string',
            'tiktok' => 'nullable|string',
            'linkedin' => 'nullable|string',
            'telegram' => 'nullable|string',
            'subject' => 'nullable|string',
            'address' => 'nullable|string',
            'city' => 'nullable|string',
            'state' => 'nullable|string',
        ]);

        $data=$request->all();
        $data["teacher_id"]=Auth::guard('teacher')->user()->id;
        $data["avater"]=$file;

        ProfileTeacher::updateOrCreate(
            ["teacher_id" => $data['teacher_id']],
            $data
        );

        return redirect()->route('teacher.edit')->with('success', 'Profile updated successfully.');
    }
}
