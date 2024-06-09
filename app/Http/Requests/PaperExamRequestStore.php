<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PaperExamRequestStore extends FormRequest
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
            "user_id" => "required|numeric|exists:users,id",
            "student_degree" => "required|numeric|lte:total_degree",
            "total_degree" => "required|numeric|gte:student_degree",
            "exam" => "required|file|mimes:pdf"
        ];
    }
}
