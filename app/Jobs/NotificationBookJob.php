<?php

namespace App\Jobs;

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
    protected $users;
    protected $book;
    public function __construct($users,$book)
    {
        $this->users=$users;
        $this->book=$book;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $dateShow = Carbon::parse($this->book->date_show);
        Carbon::setLocale("ar");
        $monthName = $dateShow->format('F'); // Full month name
        $year = $dateShow->format('Y'); // Year in 4 digits

        $message["success"]=true;
        $message["msg"]="تم رفع كتاب جديد لشهر $monthName";

        Notification::send($this->users,new NotificationBook($message));
    }
}
