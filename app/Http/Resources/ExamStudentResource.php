<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ExamStudentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray($request): array
    {
        return [
            "exam_id" => $this->exam_id,
            'title' => $this->title,
            'description' => $this->description,
            'degree' => $this->degree,
            'total' => $this->total,
        ];
    }
}
