<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class RenewSession
{
    public function handle($request, Closure $next)
    {
        if (Auth::check()) {
            $sessionLifetime = config('session.lifetime') * 60; // minutes to secands
            $lastActivity = $request->session()->get('last_activity_time');
            $currentTime = now()->timestamp;

            if ($lastActivity && ($currentTime - $lastActivity) > 3600) {
                $request->session()->put('last_activity_time', $currentTime);
                $request->session()->regenerate();
            } else {
                $request->session()->put('last_activity_time', $currentTime);
            }
        }

        return $next($request);
    }
}
