<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class QuestionResource extends JsonResource
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
            "question_answers" => json_decode($this->chooses, true)
        ];
    }
}
