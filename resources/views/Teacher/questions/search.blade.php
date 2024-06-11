@extends("Teacher.layouts.main")

@section("title-header")
<p>الاسئلة الدراسية</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        {{-- <div class="table-header">
            <div class="table-name">
            الاسئلة الدراسية
            </div>
        </div> --}}
        <div class="row">
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <th>عنوان السؤال</th>
                        <th>صورة السؤال</th>
                        <th>احتيارات السؤال</th>
                        <th>اسم الوحدة</th>
                        <th>المرحلة الدراسية</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody id="search_part">
                    @include("Teacher.questions.load")
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("question.add") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة سؤال جديد</a>
            </div>
        </div>
        {{ $questions->links() }}
    </div>
</div>
@endsection
