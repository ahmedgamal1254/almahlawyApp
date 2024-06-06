@extends("Teacher.layouts.main")

@section("content")
<div class="app-content content">
    <div class="container">
        <div class="alert alert-primary p-2">الفصول الافتراضية</div>
        <form action="{{ route("teacher.sessions.update") }}" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="{{ $vrsession->id }}">
            @csrf

            <div class="row">
                <div class="col-12">
                    <fieldset class="form-group position-relative has-icon-left mb-0">
                        <input type="text" name="name" class="form-control form-control-lg input-lg"
                        value="{{ $vrsession->name }}" id="name" placeholder="أدخل اسم الحصة">
                        <div class="form-control-position">
                            <i class="fa fa-school"></i>
                        </div>
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
                            id="email" placeholder="أدخل وصف للحصة">{{ $vrsession->description }}</textarea>
                        @error("description")
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </fieldset>
                </div>

                <div class="col-6">
                    <fieldset class="form-group position-relative has-icon-left mb-1">
                        <label for="desc">أدخل مزود الخدمة</label>
                        <select name="serviceName" id="" class="form-control form-control-lg">
                            <option value="">أدخل مزود الخدمة</option>
                            @forelse ($vrservice as $item)
                                <option
                                @if($vrsession->serviceName == $item->name) selected @endif
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
                    <fieldset class="form-group position-relative has-icon-left mb-1">
                        <label for="desc">أدخل رابط الاجتماع</label>
                        <input type="text" name="link" class="form-control form-control-lg input-lg"
                        value="{{ $vrsession->link }}" id="name" placeholder="أدخل لينك الحصة">
                        <div class="form-control-position">
                            <i class="fa fa-school"></i>
                        </div>
                        @error("link")
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </fieldset>
                </div>

                <div class="col-12">
                    <fieldset class="form-group position-relative has-icon-left mb-1">
                        <label for="">صورة مصغرة للحصة</label>
                        <input type="file" name="photo" class="form-control" id="photo" onclick="loadFile(event)">
                        <img src="{{ asset("public/app/" . $vrsession->photo) }}" id="img_display" alt="" srcset="">
                        @error("photo")
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </fieldset>
                </div>

                <div class="col-6">
                    <fieldset class="form-group position-relative has-icon-left mb-1">
                        <label for="desc">أدخل اسم المرحلة الدراسية</label>
                        <select name="school_grade_id" id="" class="form-control form-control-lg">
                            <option value="">أدخل اسم المرحلة الدراسية</option>
                            @forelse ($school_grades as $school_grade)
                                <option
                                @if($vrsession->school_grade_id == $school_grade->id) selected @endif
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
                        <select name="unit_id" id="" class="form-control form-control-lg">
                            <option value="">أدخل  الفصول الدراسية</option>
                            @forelse ($units as $unit)
                                <option
                                @if($vrsession->unit_id == $unit->id) selected @endif
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

            <button type="submit" class="btn btn-primary">ارسال</button>
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
