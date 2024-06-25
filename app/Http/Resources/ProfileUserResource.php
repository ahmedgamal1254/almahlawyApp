<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProfileUserResource extends JsonResource
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
            "name" => $this->name,
            "email" => $this->email,
            "email_verified" => $this->email_verified_at ? true:false,
            "phonenumber" => $this->phonenumber,
            "government" => $this->government,
            "total_balance" => $this->all_points,
            "current_balance" => $this->active_points,
            "img_profile" => env("APP_URL") . "/public/app/".$this->profile
        ];
    }
}
