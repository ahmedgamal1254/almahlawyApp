<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreQuestionRequest extends FormRequest
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
            'title' => 'nullable|string|unique:questions,title',
            "img" => "nullable|image|mimes:png,jpg,gif",
            'num_of_questions' => "required|numeric",
            'chooses' => ['required',"array","min:2"],
            "chooses.*"  => "required|string",
            'answer' => 'required',
            'school_grade_id' => 'required|numeric|exists:school_grades,id',
            'unit_id' => 'required|numeric|exists:units,id',
        ];
    }

    public function messages()
    {
        return [
            'title.required' => 'من فضلك أدخل عنوان السؤال',
            'chooses.required' => 'من فضلك أدخل اختيارات السؤال',
            'answer.required' => 'من فضلك أدخل الاجابة الصحيحة للسؤال',
            'unit_id.required' => 'من فضلك أدخل االوحدة التابعة لها هذا الامتحان',
            'school_grade_id.required' => "من فضلك قم باختيار الصف الدراسى التابع له هذا السؤال"
        ];
    }
}
