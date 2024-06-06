<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Government;

class GovernmentController extends Controller
{
    public function index(){
        try {
            // path json file
            $path="app/goverments/governorates.json";
            $json_data=json_decode(file_get_contents($path),true);

            foreach($json_data[2]["data"] as $government){
                $government_ar=$government["governorate_name_ar"];
                $government_en=$government["governorate_name_en"];

                $government = Government::updateOrCreate(
                    ['governorate_name_ar' => $government_ar],
                    ['governorate_name_ar'=> $government_ar,'governorate_name_en'=>$government_en, 'country'=>'مصر']
                );

                echo $government_ar . " <br/>";
            }

            return $json_data[2]["data"];
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }
}
