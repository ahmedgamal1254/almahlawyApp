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
        // Teacher::truncate();
        DB::table('teachers')->where("email","almahalwy@gmail.com")->update([
            'password' => bcrypt('12345678'),
        ]);
    }
}
