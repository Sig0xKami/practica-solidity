// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; // Se especifica la versión mínima del compilador Solidity requerida

contract Enums
 {
    // Se define un tipo de dato personalizado llamado "Status" con valores posibles
    enum Status {
        Pending,   // 0: Pedido pendiente
        Shipped,   // 1: Enviado
        Accepted,  // 2: Aceptado por el receptor
        Rejected,  // 3: Rechazado por el receptor
        Canceled   // 4: Cancelado
    }

    // Se declara una variable pública del tipo "Status"
    // Por defecto se inicializa con el primer valor del enum: Status.Pending
    
    mapping (address => Status) public tuEstado;

    // Función pública de solo lectura que devuelve el estado actual
    // Como "Status" es un enum, internamente representa un uint (0 a 4)
    function get() public view returns (Status) {
        return tuEstado[msg.sender];
    }

    // Función pública que permite actualizar el estado
    // Se debe pasar un valor del tipo Status como argumento (por ejemplo, Status.Shipped)
    function set(Status _status) public {
        tuEstado[msg.sender] = _status; 
    }

    // Función que establece directamente el estado como "Canceled"
    function cancel() public {
        tuEstado[msg.sender] = Status.Canceled;
    }
    function Enviado() public {
        tuEstado[msg.sender] = Status.Shipped;
    }

    // Función que resetea el estado al valor por defecto del enum (Status.Pending)
    function reset() public {
        delete tuEstado[msg.sender]; // "delete" en enums los lleva al valor 0, o sea Status.Pending
    }
}