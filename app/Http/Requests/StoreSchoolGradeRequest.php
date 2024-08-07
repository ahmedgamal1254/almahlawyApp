<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreSchoolGradeRequest extends FormRequest
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
            'name' => ['required',"string","unique:school_grades,name"],
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'من فضلك أدخل عنوان الصف الدراسى',
        ];
    }
}
