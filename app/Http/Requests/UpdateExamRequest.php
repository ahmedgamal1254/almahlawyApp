<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateExamRequest extends FormRequest
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
            'duration' => ['required',"numeric"],
            'start_time' => ['required'],
            'end_time' => ['required'],
            'title' => ['required'],
            'school_grade_id'=> ['required'],

        ];
    }

    public function messages()
    {
        return [
            'duration.required' => 'من فضلك أدخل مدة الامتحان',
            'start_time.required' => 'من فضلك أدحل ميعاد عرض الامتحان',
            'end_time.required' => 'من فضلك أدخل ميعاد انتهاء الامتحان',
            'title' => 'من فضلك أدخل عنوان الامتحان',
            'school_grade_id.required'=> 'من فضلك ادخل السنة الدراسية',

        ];
    }
}
