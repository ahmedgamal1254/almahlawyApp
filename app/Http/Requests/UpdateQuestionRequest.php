<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateQuestionRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'title' => 'nullable|string',
            'num_of_questions' => "required",
            'chooses' => ['required',"array","min:2"],
            "chooses.*"  => "required|string",
            'answer' => 'required',
            'school_grade_id' => 'required|numeric|exists:school_grades,id',
            'unit_id' => 'required|numeric|exists:units,id',
            "img" => "nullable|image|mimes:png,jpg,gif"
        ];
    }

    public function messages()
    {
        return [
            'title.required' => 'من فضلك أدخل عنوان السؤال',
            'chooses.required' => 'من فضلك أدخل اختيارات السؤال',
            'answer.required' => 'من فضلك أدخل الاجابة الصحيحة للسؤال',
        ];
    }
}
