<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateVrSessionRequest extends FormRequest
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
            "name" => "required|string",
            "school_grade_id"=> "required|numeric|exists:school_grades,id",
            "unit_id"=> "nullable|nullable|exists:units,id",
            "serviceName"=> "required|exists:vr_services,name",
            "link" => "required|url"
        ];
    }
}
