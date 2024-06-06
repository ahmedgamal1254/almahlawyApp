@extends("layouts.guest")

@section("title")
تسجيل حساب جديد
@endsection

@section("content")
<div class="register" style="background-image: url(https://images.unsplash.com/photo-1661090790202-2f9173c66362?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80)">
    <div class="register-overlay"></div>

    <div class="row align-items-center">

        <div class="col-xl-6 col-lg-6 order-1 order-lg-2">
            <div class="register-content">
                <span class="wow bounceIn"></span>
                <h1><a href="{{ route("home") }}">فى أى مكان ... تعليمك مرن</a></h1>
                <p>مرن هى المنصة الأولى من نعها لتعليم اللغه العربية والانجليزية للمرحلة الثانوى فى مكان واحد بكل سهولة ومرونة</p>
                <div class="register-links">
                    <a href="{{ route("home") }}" class="register-home">العودة للرئيسية</a>
                </div>
            </div>
        </div>

        <div class="col-xl-6 col-lg-6 order-2 order-lg-1">
            <div class="form-container">
                <div class="form-card">
                    <div class="form-card-parent">
                        <div class="form-box-title">إنشاء حساب جديد</div>

                        <form action="{{ route("store_student") }}" class="form" method="POST" novalidate>
                            @csrf
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>الأسم</label>
                                        <input type="text" required value="{{ old("name") }}" name="name" class="form-control">
                                    </div>
                                    @if ($errors->has('name'))
                                        @foreach ($errors->get('name') as $error)
                                            <span class="text-danger">{{ $error }}</span>
                                        @endforeach
                                    @endif
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group active-input">
                                        <label for="desc">أدخل المحافظة</label>
                                        <select name="government" id="" class="form-control form-control-lg">
                                            <option value="">أدخل اسم المحافظة</option>
                                            @forelse ($data["governments"] as $government)
                                                @if (old('government') == $government->governorate_name_ar)
                                                    <option value="{{ $government->governorate_name_ar }}" selected>{{ $government->governorate_name_ar }}
                                                    </option>
                                                @else
                                                    <option value="{{ $government->governorate_name_ar }}">{{ $government->governorate_name_ar }}
                                                    </option>
                                                @endif
                                            @empty
                                            @endforelse
                                        </select>

                                        @error("government")
                                        <span class="text-danger">من فضلك قم باختيار محافظتك</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group active-input">
                                        <label for="desc">أدخل اسم المرحلة الدراسية</label>
                                        <select name="school_grade_id" id="school_grade" class="form-control form-control-lg">
                                            <option value="">أدخل اسم المرحلة الدراسية</option>
                                            @forelse ($data["school_grades"] as $school_grade)
                                                @if (in_array($school_grade->id,array(1,2,3)))
                                                    @if (old('school_grade_id') == $school_grade->id)
                                                        <option value="{{ $school_grade->id }}" selected>{{ $school_grade->name }}</option>
                                                    @else
                                                        <option value="{{ $school_grade->id }}">{{ $school_grade->name }}</option>
                                                    @endif
                                                @endif
                                            @empty
                                                <option >لا توجد مراحل دراسية بعد</option>
                                            @endforelse
                                        </select>
                                        @error("school_grade_id")
                                        <span class="text-danger">من فضلك قم باختيار المرحلة الدراسية</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group active-input">
                                        <label for="desc">أدخل اسم المجموعة الدراسية</label>
                                        <select name="group_id" id="group" class="form-control form-control-lg">
                                            <option value="">أدخل اسم المجموعة الدراسية</option>
                                            @forelse ($data["groups"] as $group)
                                                @if (old('group_id') == $group->id)
                                                    <option value="{{ $group->id }}" selected>{{ $group->group_name }}</option>
                                                @else
                                                    <option value="{{ $group->id }}">{{ $group->group_name }}</option>
                                                @endif
                                            @empty
                                                <option >لا توجد مجموعات دراسية بعد</option>
                                            @endforelse
                                        </select>
                                        @error("group_id")
                                        <span class="text-danger">من فضلك قم باختيار المجموعة</span>
                                        @enderror

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>البريد الالكترونى</label>
                                        <input type="email" required value="{{ old("email") }}" name="email" class="form-control">
                                    </div>

                                    @if ($errors->has('email'))
                                        @foreach ($errors->get('email') as $error)
                                            <span class="text-danger">{{ $error }}</span>
                                        @endforeach
                                    @endif
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>رقم التليفون</label>
                                        <input type="tel" required value="{{ old("phone") }}" name="phone" class="form-control">
                                    </div>
                                    @if ($errors->has('phone'))
                                    @foreach ($errors->get('phone') as $error)
                                        <span class="text-danger">{{ $error }}</span>
                                    @endforeach
                                @endif
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>رقم تليفون ولى الأمر</label>
                                        <input type="tel" required value="{{ old("phone_parent") }}" name="phone_parent" class="form-control">
                                    </div>
                                    @if ($errors->has('phone_parent'))
                                        @foreach ($errors->get('password') as $error)
                                            <span class="text-danger">{{ $error }}</span>
                                        @endforeach
                                    @endif
                                </div>


                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>الباسورد</label>
                                        <input type="password" minlength="8" required name="password" class="form-control">
                                    </div>
                                    @if ($errors->has('password'))
                                        @foreach ($errors->get('password') as $error)
                                            <span class="text-danger">{{ $error }}</span>
                                        @endforeach
                                    @endif
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>تأكيد الباسورد</label>
                                        <input type="password" minlength="8" required name="password_confirmed" class="form-control">
                                    </div>
                                    @if ($errors->has('password_confirmed'))
                                        @foreach ($errors->get('password_confirmed') as $error)
                                            <span class="text-danger">{{ $error }}</span>
                                        @endforeach
                                    @endif
                                </div>
                            </div>
                            <button type="submit" class="create-account-btn">انشاء حساب</button>
                        </form>
                        <span class="login-link"><a href="{{ route("login") }}">لديك حساب بالفعل ؟</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section("script")
<script>
    async function uploadFile() {
        let input = document.createElement('input');
        input.type = 'file';
        input.onchange = _ => {
        // you can use this method to get file and perform respective operations
            let files =   Array.from(input.files);
            console.log(files);
        };
        input.click();
    }

    $(document).ajaxStart(function() {
        document.getElementById("group").innerHTML="<option id='spinner'>جارى التحميل...</option>"
    }).ajaxStop(function() {
        document.getElementById("spinner").innerHTML="";
        document.getElementById("spinner").style.display="none";
    });

    document.getElementById("school_grade").addEventListener("change",function (){
        let val=document.getElementById("school_grade").value

        document.getElementById("group").innerHTML='';
        $.ajax({
            url: "groups?school_grade_id="+val,
            type: 'get',

            success: function(data) {
                table_code=document.getElementById("group");
                console.log(data);
                if(data.length > 0){
                    for(let i=0;i<data.length;i++){
                        table_code.innerHTML+=`
                        <option value=${data[i].id}>${data[i].group_name}</option>
                        `
                    }
                }else{
                    table_code.innerHTML+=`<option>لا توحد مجموعات لعرضها</option>`
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle any errors
                console.log('Error:', textStatus, errorThrown);
            }
        });
    })
</script>
@endsection
