<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Models\User;

class RegisterRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'government' => ['required', 'string'],
            'school_grade_id' => ['required', 'integer'],
            'group_id' => ['required', 'integer'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', 'min:8', 'max:100'],
            'password_confirmed' => ['required', 'min:8', 'max:100'],
            'phonenumber' => ['required','regex:/(01)[0-9]{9}/','digits:11','unique:'.User::class] ,
            'phone_parent' => ['required','regex:/(01)[0-9]{9}/','digits:11'] ,
        ];
    }

    public function messages(){
        return [
            "name.required" => "من فضلك أدخل الاسم",
            "name.string" => "من فضلك أدخل اسم صالح",
            "email.required" => "من فضلك أدخل البريد الالكترونى",
            "email.unique" => "هذا الايميل موجود مسبقا",
            'img.mimes' => 'لقد أدخلت تنسيق خاطئ للصورة',
            'img.max' => 'عفوا حجم الصورة أكبر من المتوقع',
            'password.min' => "عفوا كلمة السر اكبر من8 ارقام ",
             'password_confirmed.min' => "عفوا كلمة السر اكبر من8 ارقام ",
            'password.required' => "عفوا لم يتم ادخال كلمة سر",
            'password.confirmed' => "كلمة السر غير متطابقة",
            'phonenumber.required' => "رقم الهاتف مطلوب",
            "phonenumber.unique" => "هذا الرقم موجود مسبقا",
             "phonenumber.digits" => "رقم الهاتف يجب ان يكون 11 رقم",
            "phonenumber.regex" => "رقم الهاتف يجب ان يكون مصري ",
            'phone_parent.required' => "رقم هافت ولى الامر مطلوب",
             "phone_parent.digits" => "رقم هاتف ولى الامر يجب ان يكون 11 رقم",
            "phone_parent.regex" => "رقم هاتف ولى الامر يجب ان يكون مصري",
        ];
    }
}
