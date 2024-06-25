<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LessonResource extends JsonResource
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
            "title"=> $this->title,
            "description" => $this->description,
            "cover" => env("APP_URL") . "/public/app/".$this->img_caption,
            "video_url"=> env("APP_URL") . "/public/app/videos/" . $this->video_url,
            "duration" => $this->duration,
            "created_at"=> $this->created_at,
            "updated_at"=> $this->updated_at
        ];
    }
}
