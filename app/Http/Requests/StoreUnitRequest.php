<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreUnitRequest extends FormRequest
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
            'title' => ['required',"string"],
            "school_grade_id" => 'required',
        ];
    }

    public function messages()
    {
        return [
            'title.required' => 'من فضلك أدخل عنوان الوحدة (الفصل)',
            "school_grade_id.required" => "من فضلك أدخل الصف الدراسى",

        ];
    }
}
