@extends("Teacher.layouts.main")

@section("title-header")
<p>الطلاب</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        {{-- <div class="table-header">
            <div class="table-name">
                <p>الطلاب</p>
            </div>
        </div> --}}
        <div class="row">
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <th>الطالب</th>
                        <th>رقم الهاتف</th>
                        <th>الصف الدراسى</th>
                        <th>المجموعة الدراسية</th>
                        <th>وقت الاضافة</th>
                        <th>مجموع النقاط</th>
                        <th>النقاط الحالية</th>
                        <th>مجموع النقاط</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody id="search_part">
                    @include("Teacher.students.load")
                </tbody>
            </table>


            <div class="row">
                <a href="{{ route("students.add") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة طالب جديد</a>
            </div>
        </div>

        {{ $students->appends(request()->query())->links() }}
    </div>
</div>
@endsection

@section("script")
    <script src="{{ asset("assets/js/ajax_student.js") }}"></script>
@endsection
