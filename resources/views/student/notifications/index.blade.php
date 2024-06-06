@extends("student.layouts.master")

@section("title")
الاشعارات
@endsection

@section("content")
<div class="container">
    <div class="payments-content">
        <div class="row">
            @foreach (Auth::user()->unreadNotifications as $item)
                <div class="col-md-12">
                    <a href="#" class="noti-read" style="color: black;">
                        <div class="card">
                            <div class="user-status row align-items-md-center justify-content-between mr-10">
                                <div class="row align-items-center" style="margin-right: 10px;">
                                    <div class="avatar-small">
                                        <span class="person-img">
                                            <svg viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M2 8.994A5.99 5.99 0 0 1 8 3h8c3.313 0 6 2.695 6 5.994V21H8c-3.313 0-6-2.695-6-5.994V8.994zM20 19V8.994A4.004 4.004 0 0 0 16 5H8a3.99 3.99 0 0 0-4 3.994v6.012A4.004 4.004 0 0 0 8 19h12zm-6-8h2v2h-2v-2zm-6 0h2v2H8v-2z"/>
                                            </svg>
                                        </span>
                                    </div>
                                    <div style="margin: 0 10px;">
                                        @if ($item->type == 'App\Notifications\UpdatePoints')
                                            <div class="user-status-title text-right">
                                                <span>اضافة رصيد</span>
                                            </div>
                                            <p class="user-status-text">{{ $item->data["msg"] }} {{ $item->data["points"] }} جنيه</p>
                                        @endif


                                    </div>
                                </div>

                                <div>
                                    <p class="user-status-timestamp">
                                        {{ $diff = Carbon\Carbon::parse($item->created_at)->diffForHumans(Carbon\Carbon::now()) }}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>
    </div>
</div>
@endsection
