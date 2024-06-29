<?php

namespace App\Jobs;

use App\Models\User;
use App\Notifications\NotificationBook;
use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Notification;

class NotificationBookJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    protected $school_grade;
    protected $book;
    public function __construct($school_grade,$book)
    {
        $this->school_grade=$school_grade;
        $this->book=$book;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $title=$this->book->title;
        $dateShow = Carbon::parse($this->book->date_show);
        Carbon::setLocale("ar");
        $monthName = $dateShow->translatedFormat('F'); // Full month name

        $message["success"]=true;
        $message["msg"]="تم رفع كتاب $title لشهر $monthName";

        $users=User::where("school_grade_id",$this->school_grade)->get();
        Notification::send($users,new NotificationBook($message));
    }
}
