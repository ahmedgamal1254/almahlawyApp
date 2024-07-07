$(function() {
    $.ajaxSetup({
        headers: {
        'X-CSRF-Token': $('meta[name="_token"]').attr('content')
        }
    });

    var element = document.getElementById("search_student");
    element.addEventListener('input', function (){
        var search=document.getElementById("search_student").value

        $.ajax({
            url:  url + "/teacher/students/search?search="+search,
            type: 'get',
            beforeSend: function () {
                $(".loader").show();
            },
            success: function(data) {

                document.getElementById("search_part").innerHTML='';
                table_code=document.getElementById("search_part");

                table_code.innerHTML=`${data.data}`

            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle any errors
                console.log('Error:', textStatus, errorThrown);
            },
            complete: function () {
                $(".loader").hide('slow');
            }
        });
    });
});

$(document).ready(function () {
    $(document).on('submit', '.points', function(e) {
        e.preventDefault();
        $.ajax({
            url: url + "/teacher/student/point",
            type: 'post',
            data:$(this).serialize(),
            beforeSend: function () {
                $(".loader").show();
            },
            success: function(data) {
                swal(data["data"]["data"])
                setTimeout(() => {
                    location.reload()
                }, 3000);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle any errors
                console.log('Error:', textStatus, errorThrown);
            },
            complete: function () {
                $(".loader").hide('slow');
            }
        });
    });
})

function get_differ_date(selected_date){
    let now=new Date() // date now
    let created_at=new Date(selected_date) // selected date to differ from now
    const diffTime = (now - created_at); // difference between date in miliseconds

    /**
    difference between date in days
    difference between date in month
    difference between date in year
    difference between date in minutes
    difference between date in seconds
    difference between date in hours
    */
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    const diffHour = Math.floor(diffTime / (1000 * 60 * 60));
    const diffMinute = Math.floor(diffTime / (1000 * 60));
    const diffsecond = Math.floor(diffTime / (1000));
    const diffyear = Math.floor(diffTime / (1000 * 60 * 60 * 24 * 365));
    const diffmonth = Math.floor(diffTime / (1000 * 60 * 60 * 24 * 30));

    if(diffsecond < 60){
        return "تم الاضافة قبل " + diffsecond + "ثوانى"
    }else if(diffMinute < 60){
        if(diffMinute <= 1){
            return "تم الاضافة قبل " + "دقيقة"
        }else if(diffMinute <= 2){
            return "تم الاضافة قبل " + "دقيقتين"
        }else{
            return "تم الاضافة قبل " + diffMinute + "دقائق"
        }
    }
    else if(diffHour < 24){
        if(diffHour <= 1){
            return "تم الاضافة قبل " + "ساعة"
        }else if(diffHour <= 2){
            return "تم الاضافة قبل " + "ساعاتين"
        }else{
            return " تم الاضافة قبل " + diffHour + "ساعات"
        }
    }else if(diffDays < 30){
        if(diffDays <= 1){
            return "تم الاضافة قبل " + "يوم"
        }else if(diffDays <= 2){
            return "تم الاضافة قبل " + "يومين"
        }else{
            return "تم الاضافة قبل " + diffDays + "أيام "
        }
    }
    else if(diffmonth < 30){
        if(diffmonth <= 1){
            return "تم الاضافة قبل " + "شهر"
        }else if(diffmonth <= 2){
            return "تم الاضافة قبل " + "شهرين"
        }else{
            return "تم الاضافة قبل " + diffmonth + " أشهر "
        }
    }else{
        if(diffyear <= 1){
            return "تم الاضافة قبل " + "سنة"
        }else if(diffyear <= 2){
            return "تم الاضافة قبل " + "سنتين"
        }else{
            return "تم الاضافة قبل " + diffyear + "سنوات "
        }
    }
}
