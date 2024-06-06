<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;
use Ramsey\Uuid\Type\Integer;

class Operation extends Component
{
    public string $edit_val;
    public string $delete_val;
    public string $view_val;
    public int $ele_id;

    public function __construct(
        string $edit,
        string $delete = "del",
        string $view = "yes",
        int $id = 0
    ) {
        $this->edit_val = $edit;
        $this->delete_val = $delete;
        $this->view_val = $view;
        $this->ele_id = $id;
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render()
    {
        $edit = $this->edit_val;
        $delete = $this->delete_val;
        $view = $this->view_val;
        $id = $this->ele_id;

        return view('components.operation', compact("edit", "delete","view", "id"));
    }
}
