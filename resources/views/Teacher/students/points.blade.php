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
        <div class="card" style="padding: 20px;">
            <form action="{{ route("students.filter") }}" method="get">
                <div class="row">
                    <div class="col-6">
                        <select style="width: 100%;" name="school_grade" class="form-select form-select-sm" id="search_school_grade" aria-label=".form-select-sm example">
                            <option selected value="0">اختر الصف الدراسى</option>
                            @forelse ($school_grades as $school_grade)
                                <option value="{{ $school_grade->id }}">{{ $school_grade->name }}</option>
                            @empty

                            @endforelse
                        </select>
                    </div>

                    <div class="col-6">
                        <select style="width: 100%;" name="group" class="form-select form-select-sm" id="search_school_grade" aria-label=".form-select-sm example">
                            <option selected value="0">اختر المجموعة الدراسية</option>
                            @forelse ($groups as $group)
                                <option value="{{ $group->id }}">{{ $group->group_name }}</option>
                            @empty

                            @endforelse
                        </select>
                    </div>

                    <div class="col-12">
                        <input class="form-control" name="name" list="datalistOptions" id="search_student" placeholder="ابحث بالاسم عن الطالب">
                    </div>

                    <div class="col-6" style="margin-top: 15px;">
                        <button type="submit" class="btn btn-primary">تطبيق</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="row">
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <th>الطالب</th>
                        <th>رقم الهاتف</th>
                        <th>الصف الدراسى</th>
                        <th>المجموعة الدراسية</th>
                        <th>وقت الاضافة</th>
                        <th>الرصيد الكلى</th>
                        <th>الرصيد الحالى</th>
                        <th>مجموع النقاط</th>
                        <th>التعديلات</th>
                    </tr>
                </thead>
                <tbody id="search_part">
                    @include("Teacher.students.load")

                    <tr>
                        <td colspan="10" class="text-center">
                            <div id="qloader" class="loader"></div>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("students.add") }}" class="btn btn-primary"><i class="fa fa-plus"></i> اضافة طالب جديد</a>
            </div>
        </div>

        {{ $students->links() }}

    </div>
</div>
@endsection

@section("script")
    <script src="{{ asset("assets/js/ajax_student.js") }}"></script>
@endsection
