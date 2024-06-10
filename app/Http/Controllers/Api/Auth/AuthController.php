<?php
namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Http\Resources\ProfileUserResource;
use App\Mail\RegisterUser;
use App\Models\RegisterToken;
use App\Traits\Upload;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class AuthController extends Controller
{
    use Upload;

    public function login(Request $request){
    	$validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        if (! $token = auth("api")->attempt($validator->validated())) {
            return response()->json(['error' => 'email or password may be or not correct'], 401);
        }

        $user = auth("api")->user();
        if (!$user->email_verified_at) {
            return response()->json(['error' => 'Email not verified'], 403);
        }

        return $this->createNewToken($token);
    }

    public function register(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'government' => ['required','string'],
            'school_grade_id' => ['required','integer'],
            'group_id' => ['required','integer'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required',"string","min:8","max:100"],
            "password_confirmed" => ["required","string","min:8","max:100",'same:password'],
            "phonenumber" => ['required','numeric','unique:users,phonenumber'],
            "phone_parent" => ['required','numeric'],
        ]);

        if($validator->fails()){
            return response()->json($validator->errors(), 400);
        }

        DB::beginTransaction();

        try {
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'phonenumber' => $request->phonenumber,
                'phone_parent' => $request->phone_parent,
                'government' => $request->government,
                'school_grade_id' => $request->school_grade_id,
                'group_id' => $request->group_id
            ]);

            $pincode=rand(100000,999999);

            // Send verification email
            RegisterToken::updateOrCreate([
                "email" => $request->email
            ],[
                "email" => $request->email,
                "pin_code" => $pincode,
                "expired_at" => Carbon::parse()->addDays(1)
            ]);

            DB::commit();

            Mail::to($request->email)->send(new RegisterUser($user,$pincode));

            return response()->json([
                'message' => 'تم تسجيل المستخدم بتجاح قم بتفعيل الحساب عن
                طريق ادخال الكود المكون من 6 أرقام',
                'user' => $user,
            ], 201);
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json(['error' => 'Registration failed, please try again.'], 500);
        }
    }

    public function logout() {
        auth("api")->logout();

        return response()->json(['message' => 'User successfully signed out']);
    }

    public function refresh() {
        return $this->createNewToken(auth("api")->refresh());
    }

    public function userProfile() {
        return response()->json(auth("api")->user());
    }

    public function update(Request $request){
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'government' => ['required','string'],
            'email' => ['required', 'string', 'email', 'max:255'],
            'password' => ['nullable',"min:8","max:100"],
            "phonenumber" => ['nullable','numeric'],
            "profile" => "nullable|image"
        ]);

        if($validator->fails()){
            return response()->json($validator->errors(), 400);
        }

        $user = Auth::guard("api")->user();

        // Update user details
        $user->name = $request->input('name');
        $user->email = $request->input('email');

        if ($request->input('password')) {
            $user->password = Hash::make($request->input('password'));
        }

        $user->government = $request->input('government');
        $user->phonenumber = $request->input('phonenumber');

        // Handle profile image upload
        if ($request->hasFile('profile')) {
            $path = $this->image_upload($request,"users","profile");
            $user->profile = $path;
        }

        $user->save();

        return response()->json(['message' => 'Profile updated successfully', 'user' => $user], 200);
    }

    protected function createNewToken($token){
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth("api")->factory()->getTTL() * 60 * 24 *30,
            'user' => new ProfileUserResource(auth("api")->user())
        ]);
    }
}