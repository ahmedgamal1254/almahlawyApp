<?php

namespace App\Http\Controllers\Teacher\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class AuthenticatedSessionController extends Controller
{
    public function create(): View
    {
        return view('Teacher.auth.login');
    }

    public function store(LoginRequest $request): RedirectResponse
    {
        // try {
            $request->authenticate("teacher");

            $request->session()->regenerate();

            return redirect("/teacher");
        // } catch (\Throwable $th) {
        //     return $th->getMessage();
        //     // return redirect()->back()->with('error','حدث خطا ما');
        // }
    }

    public function destroy(Request $request)
    {
        try {
            Auth::guard('teacher')->logout();

            $request->session()->invalidate();

            $request->session()->regenerateToken();

            return redirect('/teacher/login');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error','حدث خطا ما');
        }
    }
}
