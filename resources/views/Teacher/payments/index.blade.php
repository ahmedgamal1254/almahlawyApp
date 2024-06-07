@extends("Teacher.layouts.main")

@section("title-header")
<p>حالات الدفع</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        <div class="row">
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <th>الطالب</th>
                        <th>اثبات الدفع</th>
                        <th>
                            مشاهدة
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($payments as $payment)
                    <tr>
                        <td>{{ $payment->user ? $payment->user->name:"" }}</td>
                        <td>
                            @if ($payment->image_url)
                            <img src="{{ asset("public/app/". $payment->image_url) }}" width="100" height="100" alt="">
                            @else
                            <img src="" alt="">
                            @endif
                        </td>
                        <td>
                            <a href="{{ route("single_payment",[$payment->id]) }}" class="btn btn-primary"><i class="fa fa-eye"></i></a>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="5" class="text-center">
                            <div class="alert alert-danger">
                                <span class="message_not_found">لا توجد مدفوعات بعد</span>
                            </div>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>

        </div>
    </div>
</div>
@endsection
