<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class QuestionIfStudentExamedResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray($request): array
    {
        return [
            "question_id" => $this->id,
            "question_title" => $this->name ? $this->name:NULL,
            "question_image" => $this->img ? env("APP_URL") . "/public/app/". $this->img:NULL,
            "question_answers" => json_decode($this->chooses, true),
            "student_answer" => $this->student_answer?$this->student_answer:NULL,
            "correct_answer" => $this->answer?$this->answer:NULL
        ];
    }
}
