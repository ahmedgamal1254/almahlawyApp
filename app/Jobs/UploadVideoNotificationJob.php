<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Notifications\UploadVideoNotification;
use Carbon\Carbon;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Auth;

class UploadVideoNotificationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $users;
    protected $lesson;

    public function __construct($users,$lesson)
    {
        $this->users=$users;
        $this->lesson=$lesson;
    }

    public function handle(): void
    {
        $users=$this->users;

        $dateShow = Carbon::parse($this->lesson->date_show);
        $monthName = $dateShow->format('F'); // Full month name
        $year = $dateShow->format('Y'); // Year in 4 digits

        $message["success"]=true;
        $message["msg"]="تم رفع فيديو جديد لشهر $monthName";

        foreach ($users as $user) {
            Notification::send($user,new UploadVideoNotification($message));
        }
    }
}
