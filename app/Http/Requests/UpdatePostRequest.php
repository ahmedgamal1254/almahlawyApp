<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdatePostRequest extends FormRequest
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
            "title" => ['required',"string",Rule::unique('posts')->ignore($this->id),],
            "description" => "required",
            "school_grade_id" => 'required|numeric|exists:school_grades,id',
            "img" => "nullable|image|mimes:png,jpg"
        ];
    }

    public function messages(){
        return [
            "title.requird"=>"أدخل عنوان المنشور",
            "title.string"=>"أدخل عنوان صالح للمنشور"
        ];
    }
}
