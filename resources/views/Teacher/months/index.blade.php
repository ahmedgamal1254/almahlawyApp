@extends("Teacher.layouts.main")

@section("title-header")
<p> الشهور</p>
@endsection

@section("content")
<div class="app-content content">
     <div class="container">
        <div class="table-header">
           <div class="table-name">
            <p> الشهور</p>
           </div>
        </div>
        <div class="row">
            <table class="table table-de mb-0 table-striped table-hover">
                <thead>
                    <tr>
                        <th>الشهر</th>
                        <th>السنة</th>
                        <th>السعر</th>
                        <th>الوصف</th>
                        <th>الحالة</th>
                        <th>عرض</th>
                    </tr>
                </thead>
                <tbody class="box">
                    @forelse ($months as $item)
                    <tr class="item" draggable="true" style=" cursor: move;" id="{{ $item->id }}">
                        <td>{{ $item->month_name_ar }}</td>
                        <td>{{ $item->year }}</td>
                        <td>{{ $item->cost }}</td>
                        <td>{{ $item->month_description }}</td>
                        <td>
                           @if ($item->status==1)
                            <input type="checkbox" class="check_1 check" id="{{ $item->month_date }}" />
                            <label for="{{ $item->month_date }}" class="check_1_label label_check">{{ $item->id }}</label>
                           @else
                           <input type="checkbox" class="check_2 check" checked id="{{ $item->month_date }}" />
                           <label for="{{ $item->month_date }}" class="check_1_label label_check">{{ $item->id }}</label>
                           @endif
                        </td>
                        <td>
                            <div class="show">
                               <div class="row">
                                <a href="{{ route("show_month",["id"=>$item->id]) }}" class="btn btn-primary"><i class="fa fa-eye"></i></a>
                                <a href="{{ route("months.get",["id"=>$item->id]) }}" class="btn btn-success"><i class="fa fa-edit"></i></a>
                               </div>
                            </div>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="text-center">
                            <div class="alert alert-danger">
                                <span class="message_not_found">لا توجد شهور دراسية بعد</span>
                            </div>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>

            <div class="row">
                <a href="{{ route("months.add") }}" class="btn btn-primary"><i class="fa fa-plus"></i>اضافة شهر جديد</a>
            </div>
        </div>
    </div>
</div>
@endsection

@section("script")
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    let url="{{ env("APP_URL") }}"
    var checks = document.getElementsByClassName("check");
    var labels = document.getElementsByClassName("label_check");
    Array.from(labels).forEach(function(element) {
      element.addEventListener('click', function (){
        var id=element.innerHTML
        $.ajax({
                url: url + "/teacher/set_state/months/"+id,
                type: 'GET',
                success: function(data) {
                    // Set the options that I want
                    swal(data["msg"]);
                    // console.log(data)
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    // Handle any errors
                    console.log('Error:', textStatus, errorThrown);
                }
        });
      });
    });

    function dragItem() {
    let items=document.querySelectorAll(".item")
    box_1=null;
    boxes=document.querySelectorAll(".box")
    items.forEach(item=>{
        item.addEventListener("dragstart",function (){
            drag=item
            item.style.opacity="0.5"
        })

        item.addEventListener("dragend",function (){
            drag=null
            item.style.opacity="1"
            console.log(item)
        })

        boxes.forEach(box=>{
            box.addEventListener("dragover",function (e){
                e.preventDefault()
            })

            box.addEventListener("drop",function (){
                box.append(drag)
                box_1=box
                drag_item=drag.innerHTML
            })
        })
    })
}

window.onload=function (){
    dragItem()
}
</script>
@endsection
