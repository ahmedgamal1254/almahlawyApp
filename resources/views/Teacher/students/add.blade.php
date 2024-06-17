@extends("Teacher.layouts.main")

@section("title-header")
<p>اضافة طالب جديد</p>
@endsection

@section("content")
<div class="app-content content ">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper container-xxl p-0">
        <div class="content-body">
            <!-- Validation -->
            <section class="bs-validation">
                <div class="row">
                    <div class="col-md-12 col-12">
                        <div class="card custom-form-elements">
                            <div class="table-parent">
                                <div class="table-header">
                                    <div class="table-name">
                                        <p>إضافة طالب جديد</p>
                                    </div>
                                    <div class="table-action">
                                        <div class="table-link table-link-">
                                            <a href="{{ route("students") }}" class="btn btn-primary">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                                <span>جميع الطلاب</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route("students.store") }}"  method="post" enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group">
                                        <div class="media">
                                            <a href="javascript:void(0);" class="mr-25">
                                                <img
                                                src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
                                                id="account-upload-img"
                                                class="rounded mr-50"
                                                alt="profile image"
                                                height="80"
                                                width="80"
                                                />
                                            </a>
                                            <!-- upload and reset button -->
                                            <div class="media-body mt-75 ml-1">
                                                <label for="account-upload" class="btn btn-sm btn-primary mb-75 mr-75">رفع صورة</label>
                                                <input type="file" onchange="loadFile(event)" name="img" id="account-upload" hidden accept="image/*" />
                                                <p>نوع الصور المسموح بها ( JPG , PNG , JPEG )</p>
                                            </div>
                                            <!--/ upload and reset button -->
                                        </div>

                                        @error("img")
                                            <span class="text-error">{{ $message }}</span>
                                        @enderror
                                    </div>

                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label class="form-label">اسم الطالب</label>
                                                <input type="text"
                                                name="name"
                                                value="{{ old("name") }}"
                                                class="form-control"
                                                placeholder="مثال :  أحمد جمال" required />
                                                @error("name")
                                                    <span class="text-error">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="">البريد الالكترونى</label>
                                                <input type="email"
                                                class="form-control"
                                                name="email" id=""
                                                value="{{ old("email") }}"
                                                aria-describedby="emailHelp" placeholder="أدخل البريد الالكترونى">
                                                @error("email")
                                                    <span class="text-error">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label>الصف الدراسي</label>
                                                <select class="form-control select2 select-stage-select"
                                                 data-placeholder="اختر الصف الدراسي" required name="school_grade_id">
                                                    <option value="">اختر الصف الدراسي</option>
                                                    @forelse ($school_grades as $school_grade)
                                                        <option
                                                        @if(old("school_grade_id") == $school_grade->id) selected @endif
                                                        value="{{ $school_grade->id }}">{{ $school_grade->name }}</option>
                                                    @empty
                                                        <option value="0">لا توجد مراحل دراسية بعد</option>
                                                    @endforelse
                                                </select>

                                                @error("school_grade_id")
                                                    <span class="text-error">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <fieldset class="form-group">
                                                <label>المجموعة</label>
                                                <select class="form-control select2 select-group-select"
                                                data-placeholder="اختر المجموعة" name="group_id">
                                                    <option value="">أدخل اسم المجموعة الدراسية</option>
                                                    @forelse ($groups as $group)
                                                    <option
                                                        @if(old("group_id") == $group->id) selected @endif
                                                        value="{{ $group->id }}">{{ $group->group_name }}</option>
                                                    @empty
                                                        <option value="0">لا توجد مجموعة دراسية بعد</option>
                                                    @endforelse
                                                </select>
                                                @error("group_id")
                                                    <span class="text-error">{{ $message }}</span>
                                                @enderror
                                            </fieldset>
                                        </div>
                                        <div class="col-6">
                                            <fieldset class="form-group">
                                                <label>المحافظة</label>
                                                <select class="form-control select2 select-group-select" data-placeholder="اختر المحافظة"
                                                required name="government">
                                                    <option value="">أدخل اسم المحافظة</option>
                                                    @forelse ($governments as $item)
                                                        <option
                                                            @if(old("government") == $item->governorate_name_ar) selected @endif
                                                            value="{{ $item->governorate_name_ar }}">{{ $item->governorate_name_ar }}
                                                        </option>
                                                    @empty
                                                        <option value="0">لا توجد محافظات بعد</option>
                                                    @endforelse
                                                </select>

                                                @error("government")
                                                    <span class="text-error">{{ $message }}</span>
                                                @enderror
                                            </fieldset>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label class="form-label">رقم موبايل الطالب</label>
                                                <input type="text"
                                                value="{{ old("phonenumber") }}"
                                                class="form-control" placeholder="مثال : 01113305996" name="phonenumber" required />
                                                @error("phonenumber")
                                                    <span class="text-error">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label class="form-label">رقم موبايل ولى الأمر</label>
                                                <input type="text" class="form-control" placeholder="مثال : 01007056732"
                                                name="phone_parent"
                                                value="{{ old("phone_parent") }}"
                                                required />
                                                @error("phone_parent")
                                                    <span class="text-error">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-6"></div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="account-new-password">كلمة المرور</label>
                                                <div class="input-group form-password-toggle input-group-merge">
                                                    <input type="password" id="account-new-password" name="password" class="form-control" placeholder="ادخل كلمة المرور" />
                                                    <div class="input-group-append">
                                                        <div class="input-group-text cursor-pointer">
                                                            <i data-feather="eye"></i>
                                                        </div>
                                                    </div>
                                                    @error("password")
                                                        <span class="text-error">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="account-new-password">تأكيد كلمة المرر </label>
                                                <div class="input-group form-password-toggle input-group-merge">
                                                    <input type="password" id="account-new-password" name="password_confirmed"
                                                    class="form-control" placeholder="ادخل كلمة المرور" />
                                                    <div class="input-group-append">
                                                        <div class="input-group-text cursor-pointer">
                                                            <i data-feather="eye"></i>
                                                        </div>
                                                    </div>

                                                    @error("password_confirmed")
                                                        <span class="text-error">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="custom-form-elemrnt-button">
                                        <div class="row">
                                            <div class="col-12">
                                                <button type="submit" class="btn btn-primary">حفظ</button>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
@endsection

@section("script")
<script>
    var loadFile = function(event) {
        var output = document.getElementById('account-upload-img');
        output.src = URL.createObjectURL(event.target.files[0]);
        output.onload = function() {
            URL.revokeObjectURL(output.src) // free memory
        }
    };
</script>
@endsection
