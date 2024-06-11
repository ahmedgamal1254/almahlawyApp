<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreExamRequest extends FormRequest
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
            "title" => ["required","string","unique:exams,title"],
            "count_question" => ["required","numeric"],
            'duration' => ['required',"numeric"],
            "date_exam" => ["required","date"],
            'time_start' => ['required'],
            'time_end' => ['required'],
            'school_grade_id' => ["required","numeric","exists:school_grades,id"],
            "units" => ["required","array"]
        ];
    }

    public function messages()
    {
        return [
            'duration.required' => 'من فضلك أدخل مدة الامتحان',
            'time_start.required' => 'من فضلك أدحل ميعاد عرض الامتحان',
            'time_end.required' => 'من فضلك أدخل ميعاد انتهاء الامتحان',
            'school_grade_id.required'=> 'من فضلك ادخل السنة الدراسية',
        ];
    }
}
