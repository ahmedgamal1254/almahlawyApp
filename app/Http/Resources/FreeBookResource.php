<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class FreeBookResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray($request): array
    {
        return [
            "book_id" => $this->id,
            "title"=> $this->title,
            "description" => $this->description,
            "media_url"=> env("APP_URL") . "/public/app/books/" . $this->media_url,
            "cover" => $this->cover ? env("APP_URL") . "/public/app/".$this->cover:NULL,
        ];
    }
}
