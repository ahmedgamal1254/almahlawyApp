@extends("Teacher.layouts.main")

@section("title-header")
<p> شهر {{ $data["month"]->month_date }}</p>
@endsection

@section("content")
<div class="app-content content">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-sm-12">
                <div class="table-header mt-30">
                    <div class="table-name">
                        <p>الفيديوهات</p>
                    </div>
                 </div>
                <div class="row">
                    @foreach ($data["lessons"] as $item)
                        <div class="col-lg-3 col-md-6 col-sm-12 box-shadow-1 ml-2">
                            <div class="card">
                                <div class="card" style="width: 18rem;" class="text-center">
                                    <img class="card-img-top img-thumbnail" style="width: 100%;height:200px;" src="{{ asset("app/".$item->img_caption) }}"
                                    alt="Card image cap">
                                    <div class="card-body">
                                      <h5 class="card-title">{{ $item->title }}</h5>
                                      {{-- <p class="card-text">{{ $item->description }}.</p> --}}
                                      <a href="{{ route("lesson.show",["id"=>$item->id]) }}" class="btn btn-primary">
                                        عرض <i class="fa fa-eye"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>

                <div class="table-header mt-2">
                    <div class="table-name">
                        <p>الكتب والملخصات</p>
                    </div>
                </div>
                <div class="row">
                    @foreach ($data["books"] as $item)
                        <div class="col-lg-3 col-md-6 col-sm-12 box-shadow-1 ml-75">
                            <div class="card">
                                <div class="card" style="width: 18rem;">
                                    <img class="card-img-top img-thumbnail" style="width: 250px;height:200px;" src="{{ asset("app/".$item->caption) }}"
                                    alt="Card image cap">
                                    <div class="card-body">
                                      <h5 class="card-title">{{ $item->title }}</h5>
                                      {{-- <p class="card-text">{{ $item->description }}.</p> --}}
                                      <a href="{{ route("book.show",["id"=>$item->id]) }}" class="btn btn-primary"><i class="fa fa-eye"></i> عرض</a>
                                    </div>
                                  </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="col-lg-3 col-sm-12">
                <div class="card" style="padding: 10px 10px 0;">
                    <p>البحث بالصفوف الدراسية</p>
                </div>
                @foreach ($data["school_grades"] as $item)
                <div class="col-lg-12" style="margin-bottom: 12px;">
                    <a href="{{ route("filter_month",["id"=>$data["month"]->id,
                    "school_grade_id" => $item->id]) }}" class="btn btn-primary">
                        {{ $item->name }}
                    </a>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
@endsection
