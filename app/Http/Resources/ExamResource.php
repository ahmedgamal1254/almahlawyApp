<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ExamResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray($request): array
    {
        return [
            "id" => $this->id,
            "title" => $this->title,
            "description" => $this->description,
            "code" => $this->code,
            "duration" => $this->duration,
            "exam_date" => $this->date_exam,
            "start_time" => $this->start_time,
            "end_time" => $this->end_time,
            "questions_count" => $this->cnt
        ];
    }
}
