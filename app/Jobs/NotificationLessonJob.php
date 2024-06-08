<?php

namespace App\Jobs;

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

    /**
     * Create a new job instance.
     */
    protected $users;
    protected $message;
    public function __construct($users,$message)
    {
        $this->users=$users;
        $this->message=$message;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        Notification::send($this->users,new NotificationLesson($this->message));
    }
}
