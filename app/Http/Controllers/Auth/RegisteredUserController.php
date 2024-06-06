<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Http\Requests\RegisterRequest;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\View\View;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Traits\{
    Upload,ValidationCustom
};

class RegisteredUserController extends Controller
{
    use Upload,ValidationCustom;
    public function create(): View
    {
        $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();
        $groups=DB::table("class_studies")->where("deleted_at","=",null)->get();
        $governments=DB::table("governments")->get();

        $data["school_grades"]=$school_grades;
        $data["groups"]=$groups;
        $data["governments"]=$governments;

        return view('auth.register',compact("data"));
    }

    public function store(RegisterRequest $request)
    {
        $file=Null;
        if($request->file("img")){
            // image upload name must img
            $file=$this->image_upload($request,'users');
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'phonenumber' => $request->phone,
            'phone_parent' => $request->phone_parent,
            'profile' => $file,
            'government' => $request->government,
            'school_grade_id' => $request->school_grade_id,
            'group_id' => $request->group_id
        ]);

        event(new Registered($user));

        Auth::login($user);

        return redirect('/dashboard');
    }
}
