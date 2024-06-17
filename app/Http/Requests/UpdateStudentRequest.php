<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateStudentRequest extends FormRequest
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
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'government' => ['required', 'string'],
            'school_grade_id' => ['required', 'numeric',"exists:school_grades,id"],
            'group_id' => ['nullable', "numeric","exists:class_studies,id"],
            'email' => ['required', 'string', 'email', 'max:255', Rule::unique("users")->ignore($this->id)],
            'password' => ['nullable', 'min:8', 'max:100'],
            'password_confirmed' => ['nullable', 'min:8', 'max:100'],
            'phonenumber' => ['required','regex:/(01)[0-9]{9}/','digits:11',Rule::unique("users")->ignore($this->id)] ,
            'phone_parent' => ['required','regex:/(01)[0-9]{9}/','digits:11'] ,
        ];
    }
}
