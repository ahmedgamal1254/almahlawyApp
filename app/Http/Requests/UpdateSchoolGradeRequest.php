<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateSchoolGradeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function rules(): array
    {
        return [
            'name' => ['required',"string",Rule::unique("school_grades")->ignore($this->id)],
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'من فضلك أدخل عنوان الصف الدراسى',
        ];
    }
}
