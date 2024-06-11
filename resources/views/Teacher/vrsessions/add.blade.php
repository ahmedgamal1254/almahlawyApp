@extends("Teacher.layouts.main")

@section("content")
<div class="app-content content">
    <div class="container">
        <div class="alert alert-primary p-2">الفصول الافتراضية</div>
        <form action="{{ route("teacher.sessions.store") }}" method="post" enctype="multipart/form-data">
            @csrf

            <div class="row">
                <div class="col-12">
                    <fieldset class="form-group position-relative has-icon-left mb-0">
                        <input type="text" name="name" class="form-control form-control-lg input-lg"
                        value="{{ old("name") }}" id="name" placeholder="أدخل اسم الحصة">
                        @error("name")
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </fieldset>
                </div>

                <div class="col-12">
                    <fieldset class="form-group position-relative has-icon-left mb-0">
                        <label for="desc">أدخل وصف للحصة</label>
                        <textarea type="text" name="description" id="desc" cols="30" rows="10"
                            class="form-control form-control-lg input-lg"
                            id="email" placeholder="أدخل وصف للحصة">{{ old("description") }}</textarea>
                        @error("description")
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </fieldset>
                </div>

                <div class="col-6">
                    <fieldset class="form-group position-relative has-icon-left mb-0 mt-1">
                        <label for="desc">أدخل مزود الخدمة</label>
                        <select name="serviceName" id="" class="form-control form-control-lg">
                            <option value="">أدخل مزود الخدمة</option>
                            @forelse ($vrservice as $item)
                                <option
                                @if(old("serviceName") == $item->name) selected @endif
                                value="{{ $item->name }}">{{ $item->name }}</option>
                            @empty
                                <option value=""></option>
                            @endforelse
                        </select>

                        @error("serviceName")
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </fieldset>
                </div>

                <div class="col-6">
                    <fieldset class="form-group position-relative has-icon-left mb-1 mt-1">
                        <label for="desc">أدخل رابط الاجتماع</label>
                        <input type="text" name="link" class="form-control form-control-lg input-lg"
                        value="{{ old("link") }}" id="name" placeholder="أدخل لينك الحصة">
                        @error("link")
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </fieldset>
                </div>

                <div class="col-12">
                    <fieldset class="form-group position-relative has-icon-left mb-1">
                        <label for="">صورة مصغرة للحصة</label>
                        <input type="file" name="photo" class="form-control" id="photo" onchange="loadFile(event)">
                        <img src="" id="img_display" alt="" srcset="">
                    </fieldset>
                </div>

                <div class="col-6">
                    <fieldset class="form-group position-relative has-icon-left mb-0">
                        <label for="desc">أدخل اسم المرحلة الدراسية</label>
                        <select name="school_grade_id" id="school_grades" class="form-control form-control-lg">
                            <option value="">أدخل اسم المرحلة الدراسية</option>
                            @forelse ($school_grades as $school_grade)
                                <option
                                @if(old("school_grade_id") == $school_grade->id) selected @endif
                                value="{{ $school_grade->id }}">{{ $school_grade->name }}</option>
                            @empty
                            <option value="0">لا توجد مراحل دراسية بعد</option>
                            @endforelse
                        </select>
                        @error("school_grade_id")
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </fieldset>
                </div>

                <div class="col-6">
                    <fieldset class="form-group position-relative has-icon-left mb-0">
                        <label for="desc">أدخل الفصول الدراسية</label>
                        <select name="unit_id" id="units" class="form-control form-control-lg">
                            <option value="">أدخل  الفصول الدراسية</option>
                            @forelse ($units as $unit)
                                <option
                                @if(old("unit_id") == $unit->id) selected @endif
                                value="{{ $unit->id }}">{{ $unit->title }}</option>
                            @empty
                                <option value="0">لا توجد فصول دراسية بعد</option>
                            @endforelse
                        </select>
                        @error("unit_id")
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </fieldset>
                </div>
            </div>
            <button type="submit" class="btn btn-primary mt-1">ارسال</button>
        </form>
    </div>
</div>
@endsection

@section('script')
    <script>
        var loadFile = function(event) {
            var output = document.getElementById('img_display');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function() {
                URL.revokeObjectURL(output.src) // free memory
            }
        };

    </script>
@endsection
