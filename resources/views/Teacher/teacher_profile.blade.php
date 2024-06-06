@extends("Teacher.layouts.main")

@section("content")
<div class="app-content content">
<!-- Main -->
<div class="main">
    <h2>الملف الشخصى</h2>
    <div class="card">
        <div class="card-body">
            <i class="fa fa-pen fa-xs edit"></i>
            <form action="{{ route("teacher.update.profile") }}" method="post" enctype="multipart/form-data">
                @csrf
                <table>
                    <tbody>
                        <tr>
                            <td>الاسم</td>
                            <td>:</td>
                            <td>
                                <input type="text" name="name" class="form-control" value="{{ Auth::guard('teacher')->user()->name }}" id="">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                @if (Auth::guard('teacher')->user()->img_url)
                                    <img src="{{ asset("public/app/". Auth::guard('teacher')->user()->img_url) }}" alt="" class="img-fluid rounded img-thumbnail">
                                @else
                                    <img src="{{ asset("assets/imgs/img/people.png") }}" alt="" class="img-fluid rounded img-thumbnail">
                                @endif
                            </td>
                            <td></td>
                            <td>
                                <input type="hidden" name="id" value="{{ Auth::guard('teacher')->user()->id }}">
                                <input type="hidden" name="img" value="{{ Auth::guard('teacher')->user()->img_url }}">
                                <fieldset class="form-group position-relative has-icon-left mb-0">
                                    <label for="img">تغيير صورة البروفايل</label>
                                    <input class="form-control form-control-lg" name="img" type="file">

                                    <span class="text-danger"> </span>

                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>البريد الالكترونى</td>
                            <td>:</td>
                            <td><input type="email" name="email" class="form-control" value="{{ Auth::guard('teacher')->user()->email }}" id=""></td>
                        </tr>
                        <tr>
                            <td>كلمة المرور</td>
                            <td>:</td>
                            <td>
                                <input type="password" name="password" class="form-control"
                                value="" id="">
                                <input type="hidden" name="old_password" value="{{ Auth::guard('teacher')->user()->password }}" value="">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <button class="btn btn-success" type="submit">خفظ</button>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </form>
        </div>
    </div>
</div>
<!-- End -->
</div>
@endsection

@section("script")
<script>

<script>
@endsection
