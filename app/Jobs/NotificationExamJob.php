<?php

namespace App\Jobs;

use App\Models\User;
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
    protected $school_grade_id;
    protected $exam;
    public function __construct($school_grade_id,$exam)
    {
        $this->school_grade_id=$school_grade_id;
        $this->exam=$exam;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $title=$this->exam->title;
        $dateShow = Carbon::parse($this->exam->date_exam);
        $monthName = $dateShow->translatedFormat('F'); // Full month name

        $message["success"]=true;
        $message["msg"]="تم رفع امتحان $title لشهر $monthName";

        $users=User::where("school_grade_id",$this->school_grade_id)->get();

        Notification::send($users,new NotificationExam($message));
    }
}
