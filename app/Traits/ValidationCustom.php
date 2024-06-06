<?php
namespace App\Traits;
trait ValidationCustom{

    /**
     * i make form and i need user to input full name
    */
    public function check_name($name){
        $name=explode(" ",$name);

        if(count($name) > 3){
            return ["success"=>true];
        }else{
            return ["success"=>false];
        }
    }
}
