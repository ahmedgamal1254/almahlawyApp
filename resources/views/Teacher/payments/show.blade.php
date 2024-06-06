@extends("Teacher.layouts.main")

@section("title-header")
<p>اثبات الدفع للطالب  {{ $payment->username }}</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">

        <div class="card" style="width: 100%">
            <div class="card-body">
                @if ($payment->image_url)
                    <img src="{{ asset("public/app/". $payment->image_url) }}" alt=""
                    class="img-payment"
                    >
                @else
                    <img src="" alt="">
                @endif
            </div>
        </div>

        <form action="{{ route("points_update") }}" method="post">
            @csrf
            <input type="hidden" value="{{ $payment->user_id }}" name="user_id">
            <input type="hidden" name="payment_id" value="{{ $payment->id }}">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="أدخل نقاط للطالب" name="points" />
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="أدخل المبلغ المالى اللذى قام الطالب بدفعه" name="cost" />
            </div>
            <button type="submit" class="btn btn-primary">حفظ</button>
        </form>
        <div style="margin-bottom: 100px;"></div>
    </div>
</div>
@endsection
