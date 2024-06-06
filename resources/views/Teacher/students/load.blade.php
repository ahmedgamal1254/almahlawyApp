@forelse ($students as $student)
    <tr>
        <td>{{ $student->name }}</td>
        <td>{{ $student->phonenumber }}</td>
        <td>{{ $student->school_grade }}</td>
        <td>{{ $student->subject_name }}</td>
        <td>{{ $diff = Carbon\Carbon::parse($student->created_at)->diffForHumans(Carbon\Carbon::now()) }}</td>
        <td>{{ $student->all_points }}</td>
        <td>{{ $student->active_points }}</td>
        <td>{{ $student->points }}</td>
        <td>
            <div class="row">
                <a href="{{ route('students.edit',['id'=>$student->id]) }}" class="btn btn-primary"><i class="fa fa-edit"></i></a>
                <a href="{{ route('students.show',['id'=>$student->id]) }}" class="btn btn-success"><i class="fa fa-eye"></i></a>
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#user_{{ $student->id }}">
                    <i class="fa fa-user-graduate"></i>
                </button>
                <div class="modal fade" id="user_{{ $student->id }}" tabindex="-1" role="dialog" aria-labelledby="user" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">تعديل رصيد الطالب</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            </div>
                            <div class="modal-body">
                                <form action="" method="post" class="points">
                                    @csrf
                                    <input type="hidden" name="user_id" value="{{ $student->id }}">
                                    <div class="mb-3">
                                        <label for="number" class="form-label">تعديل رصيد الطالب {{ $student->name }}</label>
                                        <input type="number" name="point" class="form-control" id="number" placeholder="تعديل نقاط الطالب">
                                    </div>
                                    <button type="submit" class="btn btn-success">خفظ
                                    </button>
                                    <div id="qloader" class="loader"></div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
@empty
    <tr>
        <td colspan="7" class="text-center">
            <div class="alert alert-danger">
                <span class="message_not_found">
                    لا بوجد طلاب بعد
                </span>
            </div>
        </td>
    </tr>
@endforelse
