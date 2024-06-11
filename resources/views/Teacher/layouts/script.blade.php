<!-- BEGIN: Vendor JS-->
<script src="{{ asset("assets/teacher_assets//app-assets/vendors/js/vendors.min.js")}}"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<!-- BEGIN: Page JS-->
<script src="{{ asset("assets/teacher_assets/app-assets/vendors/js/charts/chart.min.js") }}"></script>
<!-- END: Page JS-->
{{-- <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.colVis.min.js" ></script> --}}
<script src="{{ asset("assets/teacher_assets/app-assets/js/core/app-menu.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/core/app.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/tables/datatable/jquery.dataTables.min.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/tables/datatable/datatables.bootstrap4.min.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/tables/datatable/dataTables.responsive.min.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/tables/datatable/responsive.bootstrap4.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/tables/datatable/datatables.checkboxes.min.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/tables/datatable/datatables.buttons.min.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/tables/datatable/jszip.min.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/tables/datatable/pdfmake.min.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/tables/datatable/vfs_fonts.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/tables/datatable/buttons.html5.min.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/tables/datatable/buttons.print.min.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/tables/datatable/dataTables.rowGroup.min.js")}}"></script>
{{-- <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.colVis.min.js" ></script> --}}
{{-- <script src="{{ asset("assets/teacher_assets/app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js")}}"></script> --}}
<script src="{{ asset("assets/teacher_assets/app-assets/js/scripts/charts/chart-chartjs.min.js")}}"></script>
<script src="{{ asset("assets/teacher_assets/app-assets/js/scripts/tables/table-template.js")}}"></script>
<script>
    try {
        let url="{{ env("APP_URL") }}"

        var element = document.getElementById("school_grades");
        element.addEventListener('change', function (){
            var school_grade=document.getElementById("school_grades").value

            let units=document.getElementById("units")
            units.innerHTML=""
            units.innerHTML+=`<option value="">اختر الفصل (الشابتر)</option>`
            $.ajax({
                url:  url + "/teachers/school_grade/" + school_grade + "/units",
                type: 'get',

                success: function(data) {
                    console.log(data)

                    data.forEach(ele => {
                        units.innerHTML+=`<option value="${ele.id}">${ele.title}</option>`
                    });
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    // Handle any errors
                    console.log('Error:', textStatus, errorThrown);
                },
            });
        });
    } catch (error) {

    }
</script>
    <script>
        $(window).on('load', function() {
            if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }
        })
        $(function () {
    $('table').wrap('<div class="table-parent"></div>');
    $('.dataTables_filter input').attr("type", "text");
    $('.dataTables_filter input').attr("placeholder", "يمكنك البحث بجميع خصائص الجدول ...");
    $('.dataTables_filter').append(`<svg class="search-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M11 2c4.968 0 9 4.032 9 9s-4.032 9-9 9-9-4.032-9-9 4.032-9 9-9zm0 16c3.867 0 7-3.133 7-7 0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7zm8.485.071l2.829 2.828-1.415 1.415-2.828-2.829 1.414-1.414z"/></svg>`);
    $(".dt-down-arrow").html(`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 3a1 1 0 0 1 1 1v16a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h16zm-9 10H5v6h6v-6zm2 6h6V5h-6v14zM11 5H5v6h6V5z"/></svg>`);
    $(".dt-buttons").wrap("<div class='table-buttons-parent'></div>");
});
    </script>

    <!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<!-- END: Page JS-->
@if(Session::has('message'))
<script>
    toastr.options =
    {
        "closeButton" : true,
        "progressBar" : true
    }
    toastr.success("{{ session('message') }}");
</script>
@endif

@if(Session::has('warning'))
<script>
    toastr.options =
    {
        "closeButton" : true,
        "progressBar" : true
    }
    toastr.warning("{{ session('warning') }}");
</script>
@endif

@if(Session::has('error'))
<script>
    toastr.options =
    {
        "closeButton" : true,
        "progressBar" : true
    }
    toastr.warning("{{ session('error') }}");
</script>
@endif
