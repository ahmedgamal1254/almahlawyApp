<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProfileUploaderRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            "img" => ['required','mimes:png,jpg,jpeg','max:2048']
        ];
    }

    public function messages(){
        return [
            'img.required' => 'عفوا لم يتم رفع الصورة',
            'img.mimes' => 'لقد أدخلت تنسيق خاطئ للصورة',
            'img.max' => 'عفوا حجم الصورة أكبر من المتوقع'
        ];
    }
}
