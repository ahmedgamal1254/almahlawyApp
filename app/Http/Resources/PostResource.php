<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PostResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray($request): array
    {
        return [
            "post_id" => $this->id,
            "title"=> $this->title,
            "description" => $this->description,
            "image_url"=> $this->image_url?env("APP_URL") . "/public/app/".$this->image_url:NULL,
            "created_at"=> $this->created_at,
            "updated_at"=> $this->updated_at
        ];
    }
}
