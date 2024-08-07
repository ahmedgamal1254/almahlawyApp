<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreFreeLessonRequest extends FormRequest
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
            'title' => "required|string|unique:free_videos,title",
            "description" => "required",
            "img" => "required|image|mimes:png,jpg",
            'school_grade_id' => 'required|numeric|exists:school_grades,id',
            "unit_id" => "nullable|numeric|exists:units,id"
        ];
    }
}
