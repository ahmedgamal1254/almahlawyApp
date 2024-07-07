<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Teacher;
use Illuminate\Support\Facades\DB;

class TeacherSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        Teacher::updateOrCreate([
            "email"=>"almahalwy@gmail.com",
        ],[
            "email"=>"almahalwy@gmail.com",
            'password' => bcrypt('b#%89=?nltQ1@5un#S%XTI%Q)fUKpPjYsZjf0YSU7;SVO#e')
        ]);
    }
}
