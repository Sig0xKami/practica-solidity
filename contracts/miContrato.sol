// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract MiContrato{
    string public saludo = "Hola polygon";

    function SetSaludo(string calldata _nuevo) external{
        saludo = _nuevo;
    }
}