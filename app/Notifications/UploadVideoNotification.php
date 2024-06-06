<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class UploadVideoNotification extends Notification
{
    use Queueable;

    private $data=[];

    public function __construct($data)
    {
        $this->data=$data;
    }

    public function via(object $notifiable): array
    {
        return ['database'];
    }

    public function toArray(object $notifiable): array
    {
        return [
            "message" => $this->data["msg"],
            "teacher_name" => $this->data["teacher_name"],
        ];
    }
}
