// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Struct {
     
     struct Tarea{
        string texto;
        bool completado;
     }
     // Estruct + mapping
    //tareaPorUsuario lo que hace es asociar una address a cada struct individualmente
     mapping(address => Tarea[]) public TareasPorUsuario;
     



    function CrearTarea(string calldata _tareaT) public {
    TareasPorUsuario[msg.sender].push(Tarea(_tareaT,false));
    }

    function get(uint256 _index) public view returns (string memory texto, bool completado )
    {
       Tarea storage tarea = TareasPorUsuario[msg.sender][_index];
       return (tarea.texto, tarea.completado);
    }

     function TareasCompletadas(uint256 _index) public{
        require(_index < TareasPorUsuario[msg.sender].length, "Indice fuera de rango");
        Tarea storage tarea = TareasPorUsuario[msg.sender][_index];
        tarea.completado = !tarea.completado; // Alternar entre true y false
     } 

    // function EditarTexto

    // function ConsultarTarea
}