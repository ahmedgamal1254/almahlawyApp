<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreMediaRequest extends FormRequest
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
            'title' => "required|unique:media,title",
            "description" => "required",
            "img" => "required|image|mimes:png,jpg",
            'school_grade_id' => 'required|numeric|exists:school_grades,id',
            'date_show' => 'required'
        ];
    }

    public function messages()
    {
        return [
            "title.required" => "قم بوضع اسم الكتاب",
            "pdf" => "قم برفع الكتاب",
            "img" => "قم برفع غلاف للكتاب",
            "school_grade_id.required" => "من فضلك أدخل الصف الدراسى",
            "date_show" => ' من فضلك أدخل موعد عرض الكتاب'

        ];
    }
}
