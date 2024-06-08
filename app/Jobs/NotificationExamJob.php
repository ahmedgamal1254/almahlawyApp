<?php

namespace App\Jobs;

use App\Notifications\NotificationExam;
use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Notification;

class NotificationExamJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    protected $users;
    protected $exam;
    public function __construct($users,$exam)
    {
        $this->users=$users;
        $this->exam=$exam;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $dateShow = Carbon::parse($this->exam->date_exam);
        $monthName = $dateShow->format('F'); // Full month name
        $year = $dateShow->format('Y'); // Year in 4 digits

        $message["success"]=true;
        $message["msg"]="تم رفع امتحان جديد لشهر $monthName";

        Notification::send($this->users,new NotificationExam($message));
    }
}
