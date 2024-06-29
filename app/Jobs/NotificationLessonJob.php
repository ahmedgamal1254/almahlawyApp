<?php

namespace App\Jobs;

use App\Models\User;
use App\Notifications\NotificationLesson;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Notification;

class NotificationLessonJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $school_grade_id;
    protected $message;
    public function __construct($school_grade_id,$message)
    {
        $this->school_grade_id=$school_grade_id;
        $this->message=$message;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $users=User::where("school_grade_id",$this->school_grade_id)->get();

        Notification::send($users,new NotificationLesson($this->message));
    }
}
