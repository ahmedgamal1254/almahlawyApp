@extends("student.layouts.master")

@section("title")
المدفوعات
@endsection

@section("content")
<div class="container">
    <div class="payments-content">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="pay-card text-right">
                    <p class="pay-card-title">محفظتى</p>
                    <div class="pay-card-content text-center">
                        <div class="icon-parent" style="background-color: #095bec;">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M18.0049 7H21.0049C21.5572 7 22.0049 7.44772 22.0049 8V20C22.0049 20.5523 21.5572 21 21.0049 21H3.00488C2.4526 21 2.00488 20.5523 2.00488 20V4C2.00488 3.44772 2.4526 3 3.00488 3H18.0049V7ZM4.00488 9V19H20.0049V9H4.00488ZM4.00488 5V7H16.0049V5H4.00488ZM15.0049 13H18.0049V15H15.0049V13Z"></path></svg>
                        </div>
                        <h6>{{ Auth::user()->active_points }}<span>L.E</span></h6>
                        <p>رصيد متوفر فى محفظتك للدفع على المنصة</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="pay-card text-right new-payment">
                    <p class="pay-card-title">معاملة جديدة</p>
                    <div class="pay-card-content text-center">
                        <div class="icon-parent" data-target="#exampleModal" style="background-color: #04bade;">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M11 11V5H13V11H19V13H13V19H11V13H5V11H11Z"></path></svg>
                        </div>
                        <h6>شحن الحساب</h6>
                        <p> اشحن حسابك من بيتك بكل سهولة وامان</p>
                    </div>
                </div>
            </div>

            <div class="col-12">
                <div class="payments-history">
                    <div class="absence-head d-flex">
                        <p class="text-right">تاريخ المدفوعات</p>
                        <div class="payments-tabs text-left">
                            <p class="payments-tab active" data-id="#charge">شحن الحساب</p>
                            <p class="payments-tab" data-id="#invoice">الشهور</p>
                        </div>
                    </div>

                    <table class="table table-striped table-hover" id="invoice">

                        <thead>
                          <tr>
                            <th scope="col" class="text-right">تاريخ الدفع</th>
                            <th scope="col"  class="text-right">الشهر</th>
                            <th scope="col" class="text-right">السعر</th>
                            <th scope="col" class="text-right">المدرس</th>
                          </tr>
                        </thead>

                        <tbody>
                            @forelse ($months as $month)
                                <tr>
                                    <th class="text-right light">
                                        {{ arabic_date_format($month->created_at) }}
                                    </th>
                                    <td class="text-right">اشتراك شهر {{ $month->month_num }} ل سنة {{ $month->year }}</td>
                                    <td class="text-right">{{ $month->cost }}<span class="cur">L.E</span></td>
                                    <td class="text-right">
                                        {{ $month->teacher_name }}
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="text-center">لا توجد عمليات شراء شهور بعد</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>

                    <table class="table table-striped table-hover show" id="charge">

                        <thead>
                          <tr>
                            <th scope="col" class="text-right">تاريخ الدفع</th>
                            <th scope="col"  class="text-right">المدرس</th>
                            <th scope="col" class="text-right">المبلغ</th>
                            <th scope="col" class="text-right">الحالة</th>
                          </tr>
                        </thead>

                        <tbody>
                            @forelse ($payments as $payment)
                            <tr>
                                <th class="text-right light">
                                    {{ arabic_date_format($payment->created_at) }}
                                </th>
                                <td class="text-right">{{ $payment->teacher_name  }}</td>
                                <td class="text-right">{{ $payment->value == null?0:$payment->value }}<span class="cur">L.E</span></td>
                                <td class="pending text-right">
                                    @switch($payment->status)
                                        @case(1)
                                            <span class="btn btn-primary">قيد الانتظار</span>
                                            @break
                                        @default
                                        @case(0)
                                             <span class="btn btn-success">تم الدفع</span>
                                            @break
                                        @case(2)
                                            <span class="btn btn-warning">لم يتم الدفع</span>
                                            @break
                                    @endswitch
                                </td>
                              </tr>
                            @empty
                            <tr>
                                <td colspan="4" class="text-right">لا توجد مدفوعات بعد</td>
                            </tr>
                            @endforelse

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="new-payment-popup popup" id="exampleModal">
    <div class="popup-overlay"></div>
    <div class="new-payment-popup-content popup-content">
        <div class="form-container">
            <div class="form-card">
                <div class="form-box-title">عملية دفع جديدة</div>
                <span class="close-o">
                    <svg id="svg-cross" viewBox="0 0 12 12" preserveAspectRatio="xMinYMin meet">
                        <path d="M12,9.6L9.6,12L6,8.399L2.4,12L0,9.6L3.6,6L0,2.4L2.4,0L6,3.6L9.6,0L12,2.4L8.399,6L12,9.6z"></path>
                    </svg>
                </span>
                <form action="" class="form" id="form-payment" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label>اختر المدرس</label>
                                <select class="form-control" name="teacher_id">
                                    @foreach ($teachers as $teacher)
                                    <option value="{{ $teacher->id }}">{{ $teacher->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="pay-card text-right">
                        <p class="pay-card-title">اثبات الدفع</p>
                        <input type="file" class="my-pond" name="img"/>
                    </div>
                    <button type="submit" class="create-account-btn"><svg class="svg-icon" viewBox="0 0 20 20">
                        <path fill="none" d="M18.737,9.691h-5.462c-0.279,0-0.527,0.174-0.619,0.437l-1.444,4.104L8.984,3.195c-0.059-0.29-0.307-0.506-0.603-0.523C8.09,2.657,7.814,2.838,7.721,3.12L5.568,9.668H1.244c-0.36,0-0.655,0.291-0.655,0.655c0,0.36,0.294,0.655,0.655,0.655h4.8c0.281,0,0.532-0.182,0.621-0.45l1.526-4.645l2.207,10.938c0.059,0.289,0.304,0.502,0.595,0.524c0.016,0,0.031,0,0.046,0c0.276,0,0.524-0.174,0.619-0.437L13.738,11h4.999c0.363,0,0.655-0.294,0.655-0.655C19.392,9.982,19.1,9.691,18.737,9.691z"></path>
                    </svg>
                     شحن الحساب</button>
                     <div id="qloader" class="loader"></div>

                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@section("script")
<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-exif-orientation/dist/filepond-plugin-image-exif-orientation.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-encode/dist/filepond-plugin-file-encode.js"></script>
<script>
FilePond.registerPlugin(

    // encodes the file as base64 data
    FilePondPluginFileEncode,

    // validates the size of the file
    FilePondPluginFileValidateSize,

    // corrects mobile image orientation
    FilePondPluginImageExifOrientation,

    // previews dropped images
    FilePondPluginImagePreview
);
$(document).ready(function () {

$('.my-pond').filepond({
    allowMultiple: true,
    allowImagePreview: true,
    imagePreviewMinHeight: 100
});

});
</script>

<script>
    $(document).ajaxStart(function() {
        $("#qloader").show();
    }).ajaxStop(function() {
        $("#qloader").hide('slow');
    });

    $(document).ready(function () {
        // Show New Payment Popup
        $(".new-payment").on("click", function () {
            $(".new-payment-popup").addClass("open-popup");
        });

        // Show New Buy Popup
        $(".buy").on("click", function () {
            $(".new-buy-popup").addClass("open-popup");
        });

        // Close Popups
        $(".close-o, .popup-overlay").on("click", function () {
            $(".popup").removeClass("open-popup");
        });

        // Toggle Charge & Invoice Tabs
        $(".payments-tab").on("click", function () {
            $(this).addClass("active");
            $(this).siblings().removeClass("active");
            $(".table").fadeOut(10);
            $($(this).data("id")).fadeToggle(1000);
        });

    });

    document.getElementById("form-payment").addEventListener('submit', function (e){
        e.preventDefault();

        $.ajax({
            url: "{{ route('payments.store') }}",
            type: 'POST',
            data: new FormData(this),
            dataType: 'JSON',
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                // Set the options that I want
                swal(data["message"])
                document.getElementById("form-payment").reset()
                console.log(data)

                setTimeout(() => {

                }, 2000);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle any errors
                console.log('Error:', textStatus, errorThrown);
            }
        });
    });
</script>
@endsection
