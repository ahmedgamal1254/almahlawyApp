<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MonthRequest extends FormRequest
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
            "description" => "required",
            'cost'=>'required|numeric',
            'month' => 'required||date_format:Y-m|unique:months,month_date'
        ];
    }

    public function messages(){
        return [
            'cost.required' => "من فضلك أدخل تكلفة الشهر",
            "month.required" => "من فضلك أدخل تاريخ الشهر والسنة"
        ];
    }
}
