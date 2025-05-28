// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Tarea {
    struct TareaStruct {
        string text;
        bool completed;
    }

    TareaStruct[] public tareas;

    function create(string calldata _text) public {
        tareas.push(TareaStruct(_text, false));
    }

    function toggleCompleted(uint256 _index) public {
        TareaStruct storage tarea = tareas[_index];
        tarea.completed = !tarea.completed;
    }

    function updateText(uint256 _index, string calldata _text) public {
        TareaStruct storage tarea = tareas[_index];
        tarea.text = _text;
    }

    function get(uint256 _index)
        public
        view
        returns (string memory text, bool completed)
    { 
        TareaStruct storage tarea = tareas[_index];
        //	•	Accede al array tareas y busca la tarea en la posición _index.
	    //  •	Guarda una referencia directa a esa tarea en una variable llamada tarea.
        return (tarea.text, tarea.completed);
    }
}