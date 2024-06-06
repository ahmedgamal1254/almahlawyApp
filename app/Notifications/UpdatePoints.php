<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class UpdatePoints extends Notification
{
    use Queueable;

    protected $message;
    public function __construct($message)
    {
        $this->message=$message;
    }

    public function via(object $notifiable): array
    {
        return ['database'];
    }

    public function toArray(object $notifiable): array
    {
        return [
            "msg" => $this->message['msg'],
            "points" => $this->message['points'],
            "teacher_name" => $this->message["teacher_name"]
        ];
    }
}
