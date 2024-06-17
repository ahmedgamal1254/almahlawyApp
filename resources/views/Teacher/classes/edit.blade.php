@extends("Teacher.layouts.main")

@section("title-header")
<p>المجموعات</p>
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
                            <div class="table-parent">
                                <div class="table-header">
                                    <div class="table-name">
                                        <p>إضافة مجموعة جديدة</p>
                                    </div>
                                    <div class="table-link table-link-">
                                        <a href="{{ route("class") }}" class="btn btn-primary">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layout"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="3" y1="9" x2="21" y2="9"></line><line x1="9" y1="21" x2="9" y2="9"></line></svg>
                                            <span>جميع المجموعات</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="{{ route("class.update") }}" method="post">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $class->id }}">
                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل اسم المجموعة الدراسية</label>
                                        <input type="text" name="group_name"
                                            class="form-control form-control-lg input-lg"
                                            value="{{ $class->group_name }}" id="" placeholder="مثل :- سنتر او اونلاين">
                                        @error("group_name")
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>

                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                        <label for="desc">أدخل وصف  المجموعة الدراسية</label>
                                        <textarea name="description"
                                            class="form-control form-control-lg input-lg"
                                            placeholder="أدخل وصف المجموعة">{{ $class->description }}</textarea>
                                        @error("description")
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </fieldset>


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
            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
        </div>
    </div>
</div>
@endsection
