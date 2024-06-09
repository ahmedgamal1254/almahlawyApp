@forelse ($questions as $item)
<tr>
    <td>
        {{ $item->name }}
    </td>
    <td>
        @if ($item->img)
            <img src="{{ asset("public/app/" . $item->img) }}" style="width:150px;height:150px;" alt="">
        @endif
    </td>
    <td>
        @if (is_array(json_decode($item->chooses, true)))
        @forelse (json_decode($item->chooses, true) as $index => $choose)
            <span class="d-block">{{ $index + 1 }} - {{ $choose }}</span>
        @empty

        @endforelse
    @endif
    </td>
    <td>
        {{ $item->answer }}
    </td>
    <td>
        {{ $item->degree }}
    </td>
    <td>
        {{ $item->unit_name }}
    </td>
    <td>
        {{ $item->school_grade }}
    </td>
    <td>
        <x-operation
            :edit="route('question.edit',['id'=>$item->id])"
            :view="route('question.show',['id'=>$item->id])"
            :delete="route('question.destroy',['id'=>$item->id])"
            :id="$item->id"
            >
        </x-operation>
    </td>
</tr>
@empty
<tr>
    <td colspan="7" class="text-center">
        <div class="alert alert-danger">
            <span class="message_not_found">لا توجد أسئلة دراسية بعد</span>
        </div>
    </td>
</tr>
@endforelse
