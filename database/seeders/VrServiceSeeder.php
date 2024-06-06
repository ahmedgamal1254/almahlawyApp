<?php

namespace Database\Seeders;

use App\Models\VrService;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class VrServiceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        VrService::create(["name"=>"zoom"]);
        VrService::create(["name"=>"google meet"]);
        VrService::create(["name"=>"vconnect"]);
    }
}
