<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateUnitRequest extends FormRequest
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
             "title" => ['required',"string",Rule::unique("units")->ignore($this->id)],
         ];
     }

     public function messages(){
         return [
             'title.required' => "من فضلك أدخل اسم الوحدة",
             'title.string' => "من فضلك أدخل اسم صالح للوحدة",
         ];
     }
}
