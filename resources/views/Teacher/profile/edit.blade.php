@extends("Teacher.layouts.main")

@section("title-header")
<p>تعديل الملف الشخصى</p>
@endsection

@section("content")
<div class="app-content content ">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper container-xxl p-0">
        <div class="content-body">
            <section class="bs-validation">
                <div class="row">
                    <div class="col-md-12 col-12">
                        <div class="card custom-form-elements">
                            <div class="card-body">
                                <form action="{{ route('teacher.update') }}" method="post" enctype="multipart/form-data">
                                    @csrf

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="phonenumber">رقم الهاتف</label>
                                        <input type="text" name="phonenumber"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("phonenumber" , isset($profile->phonenumber) ? $profile->phonenumber : '') }}" id="phonenumber" placeholder="أدخل رقم الهاتف">
                                        @error('phonenumber')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="whatsapp">واتساب</label>
                                        <input type="text" name="whatsapp"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("whatsapp" , isset($profile->whatsapp) ? $profile->whatsapp : '') }}" id="whatsapp" placeholder="أدخل رقم الواتساب">
                                        @error('whatsapp')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="bio">السيرة الذاتية</label>
                                        <textarea name="bio" id="bio" cols="30" rows="10"
                                               class="form-control form-control-lg input-lg"
                                               placeholder="أدخل السيرة الذاتية">{{ old("whatsapp" , isset($profile->bio) ? $profile->bio : '') }}</textarea>
                                        @error('bio')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="avatar">الصورة الشخصية</label>
                                        <input class="form-control form-control-lg" id="avatar" name="img" type="file">
                                        @isset($profile->avater)
                                            <img src="{{ asset("app/" . $profile->avater) }}" alt="">
                                        @endisset
                                        @error('img')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="facebook">فيسبوك</label>
                                        <input type="text" name="facebook"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("facebook" , isset($profile->facebook) ? $profile->facebook : '') }}" id="facebook" placeholder="أدخل رابط فيسبوك">
                                        @error('facebook')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="youtube">يوتيوب</label>
                                        <input type="text" name="youtube"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("youtube" , isset($profile->youtube) ? $profile->youtube : '') }}" id="youtube" placeholder="أدخل رابط يوتيوب">
                                        @error('youtube')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="instagram">انستغرام</label>
                                        <input type="text" name="instagram"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("instagram" ,isset($profile->instagram) ? $profile->instagram : '') }}" id="instagram" placeholder="أدخل رابط انستغرام">
                                        @error('instagram')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="tiktok">تيكتوك</label>
                                        <input type="text" name="tiktok"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("tiktok" ,isset($profile->tiktok) ? $profile->tiktok : '') }}" id="tiktok" placeholder="أدخل رابط تيكتوك">
                                        @error('tiktok')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="linkedin">لينكدإن</label>
                                        <input type="text" name="linkedin"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("linkedin" ,isset($profile->linkedin) ? $profile->linkedin : '') }}" id="linkedin" placeholder="أدخل رابط لينكدإن">
                                        @error('linkedin')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="telegram">تيليجرام</label>
                                        <input type="text" name="telegram"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("telegram" ,isset($profile->telegram) ? $profile->telegram : '') }}" id="telegram" placeholder="أدخل رابط تيليجرام">
                                        @error('telegram')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="subject">المادة</label>
                                        <input type="text" name="subject"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("subject" ,isset($profile->subject) ? $profile->subject : '') }}" id="subject" placeholder="أدخل المادة">
                                        @error('subject')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="address">العنوان</label>
                                        <input type="text" name="address"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("address" ,isset($profile->address) ? $profile->address : '') }}" id="address" placeholder="أدخل العنوان">
                                        @error('address')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="city">المدينة</label>
                                        <input type="text" name="city"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("city" ,isset($profile->city) ? $profile->city : '') }}" id="city" placeholder="أدخل المدينة">
                                        @error('city')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="state">الولاية</label>
                                        <input type="text" name="state"
                                               class="form-control form-control-lg input-lg"
                                               value="{{ old("state" ,isset($profile->state) ? $profile->state : '') }}" id="state" placeholder="أدخل الولاية">
                                        @error('state')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <button type="submit" class="btn btn-primary">إرسال</button>
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
