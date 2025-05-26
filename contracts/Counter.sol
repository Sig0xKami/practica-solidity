// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;


contract CounterSi {

mapping(address => uint256) public cuentaP;


function sum() public {
  cuentaP[msg.sender] +=1;
}

function res() public {
  cuentaP[msg.sender] -=1;
}

function get() public view returns(uint256) {
  return cuentaP[msg.sender];
}

function GetPublic(address _user) public view returns(uint256){
  return cuentaP[_user];
}

}