@extends("layouts_teacher_view.main-profile")

@section("title")
رفع ايصال اثبات الدفع
@endsection

@section("content")
<div class="container">
    <div class="payments-content">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <div class="alert">قم برفع ايصال الدفع الخاص بك</div>
            <form action="{{ route("payments.store")}}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="form-group ">
                    <select class="form-select form-select-sm" name="teacher_id" aria-label=".form-select-sm example">
                        <option selected>اختر المدرس</option>
                        @foreach ($teachers as $teacher)
                            <option value="{{ $teacher->id }}">{{ $teacher->name }}</option>
                        @endforeach
                    </select>
                </div>
                <fieldset class="form-group position-relative has-icon-left mb-0">
                    <label for="" class="mb-75">أرفع صورة اثبات الدفع</label>
                    <br>
                    <input class="form-control form-control-lg" id="img" name="img" type="file">

                    <span class="text-danger"> </span>

                </fieldset>

                <button type="submit" class="btn btn-success">ارسال</button>
            </form>
        </div>
    </div>
</div>
@endsection
