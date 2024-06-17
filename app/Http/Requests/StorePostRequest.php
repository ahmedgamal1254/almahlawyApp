<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StorePostRequest extends FormRequest
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
            "title" => ['required',"string","unique:posts,title"],
            "description" => "required",
            "school_grade_id" => 'required|numeric|exists:school_grades,id',
            "img" => "nullable|image|mimes:png,jpg"
        ];
    }

    public function messages(){
        return [
            'title.required' => "من فضلك أدخل عنوان للبوست",
            "title.string"=>"أدخل عنوان صالح للمنشور",
            "school_grade_id.required" => "من فضلك أدخل الصف الدراسى",
        ];
    }
}
