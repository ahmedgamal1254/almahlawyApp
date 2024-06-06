<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Notifications\UploadVideoNotification;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Auth;

class UploadVideoNotificationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    private $data=[];
    private $video_id;
    private $teacher;

    public function __construct($data,$video_id,$teacher)
    {
        $this->data=$data;
        $this->video_id=$video_id;
        $this->teacher=$teacher;
    }

    public function handle(): void
    {
        $users=$this->data;
        
        $message["success"]=true;
        $message["msg"]="تم رفع فيديو جديد ";
        $message["teacher_name"]=$this->teacher;
        
        foreach ($users as $user) {
            Notification::send($user,new UploadVideoNotification($message));
        }
    }
}
