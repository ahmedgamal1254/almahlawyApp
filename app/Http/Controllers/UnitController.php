<?php

namespace App\Http\Controllers;

use App\Models\Unit;
use App\Http\Requests\StoreUnitRequest;
use App\Http\Requests\UpdateUnitRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Traits\ResponseRequest;
class UnitController extends Controller
{
    use ResponseRequest;
    public function index()
    {
       try {
            $units=DB::table('units')
            ->join('school_grades', 'units.school_grade_id', '=', 'school_grades.id')
            ->select('units.*', 'school_grades.name as school_grade')
            ->where("units.teacher_id","=",Auth::guard('teacher')->user()->id)
            ->orderByDesc("created_at")
            ->paginate(10);

            return view("Teacher.units.index",compact('units'));
       } catch (\Throwable $th) {
        return redirect()->back()->with('error',"عفوا حدث خطأ ما");
       }
    }

    public function search(Request $request){
        try {
            $units=DB::table("units")->where("title","LIKE","%". $request->input("search") ."%")->get();

            return $this->make_response($units,200);
        } catch (\Throwable $th) {
            return $this->make_response("حدث خطا ما غير مقصود",200);
        }
    }

    public function create()
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();

            return view("Teacher.units.add",compact("school_grades"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function store(StoreUnitRequest $request)
    {
        try {
            $unit=new Unit();
            $unit->title=$request->title;
            $unit->description=$request->description;
            $unit->school_grade_id=$request->school_grade_id;
            $unit->subject_id=Auth::guard('teacher')->user()->subject_id;
            $unit->teacher_id=Auth::guard('teacher')->user()->id;
            $unit->save();

            return redirect()->route("units")->with('message','تم اضافة  الفصل (الوحدة) بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function show($id)
    {
        try {
            $unit=DB::table('units')
            ->join('school_grades', 'units.school_grade_id', '=', 'school_grades.id')
            ->select('units.*','school_grades.name as school_grade')
            ->where('units.id','=',$id)
            ->first();

            if(!$unit){
                return redirect()->back()->with('error', 'هذه الوحدة غير موجودة' . $id);
            }

            return view("Teacher.units.show",compact("unit"));
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    public function edit($id)
    {
        try {
            $school_grades=DB::table("school_grades")->where("deleted_at","=",null)->get();

            $unit=Unit::findOrFail($id);

            if(!$unit){
                return redirect()->back()->with('error', 'هذه الوحدة غير موجودة' . $id);
            }

            return view("Teacher.units.edit",compact("school_grades","unit"));
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function update(UpdateUnitRequest $request)
    {
        try {
            $unit=Unit::find($request->id);
            $unit->title=$request->title;
            $unit->description=$request->description;
            $unit->school_grade_id=$request->school_grade_id;
            $unit->subject_id=Auth::guard('teacher')->user()->subject_id;
            $unit->teacher_id=Auth::guard('teacher')->user()->id;
            $unit->save();

            return redirect()->route("units")->with('message','تم حفظ  الفصل (الوحدة) بنجاح');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error',"عفوا حدث خطأ ما");
        }
    }

    public function destroy($id)
    {
        //
    }
}
