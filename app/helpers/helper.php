<?php
use Carbon\Carbon;

function arabic_date_format($date_time){
    $date = new DateTime($date_time);
    $month = $date->format('F');

    $months = array(
        "January" => "يناير",
        "February" => "فبراير",
        "March" => "مارس",
        "April" => "أبريل",
        "May" => "مايو",
        "June" => "يونيو",
        "July" => "يوليو",
        "August" => "أغسطس",
        "September" => "سبتمبر",
        "October" => "أكتوبر",
        "November" => "نوفمبر",
        "December" => "ديسمبر"
    );


    $result=$date->format("d") . "-" . $months[$month] . "-" . $date->format("Y");
    return $result;
}
