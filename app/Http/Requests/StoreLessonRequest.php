<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreLessonRequest extends FormRequest
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
            "date_show"=>["required"],
            "title"=>["required","string","unique:lessons,title"],
            "description" => "required",
            "img" => "required|image|mimes:png,jpg",
            'school_grade_id' => 'required|numeric|exists:school_grades,id',
            "unit_id" => "required|numeric|exists:units,id",
        ];
    }

    public function messages(){
        return [
            "date_show.requird"=>"أدخل ميعاد عرض الفيديو",
            "title.requird"=>"أدخل عنوان للفيديو",
            "title.string"=>"أدخل عنوان صالح للفيديو",
            "school_grade_id.required" => "من فضلك أدخل الصف الدراسى",
            "subject_id.required" => "من فضلك أدحل الوحدة(الفصل)"
        ];
    }
}
