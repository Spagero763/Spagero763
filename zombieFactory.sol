// SPDX-License-Identifier: MIT

/**learning about solifity 

//types of integer 
int
uint

we have for uint and int
a-b;
a*b;
a/b;
a%b;
a+b;

creating struct we can use to creates name, age ,wallet address,
// maximum nuber is 256 bytes from 8.
starting form the code aspect:

the array allows us to use another element to access another element
example ; Zombie[] public zombies; zpmbies is used to access zombie in functon and also punlic is allowed for people to access the code
spdx//:magnetic-identifier;mit

so if we make a function private only the person who code it can have access to the code.

if we want to generate a random output not from the above contart we can just use the _str  in the function

event is the one that allows the communicationnbetween front-end and back-end

msg.sender 

as we can see in the function side we can se that we access the array using the zombies**/
pragma solidity ^0.8.26;

contract zombieFactory{

event NewZombie(uint ZombieId, string name, uint dna);

  uint dnaDigits = 16;
  uint dnaModulus = 10 ** dnaDigits;
struct Zombie{
  string name;
  uint dna;
}
 mapping(uint => address) public zombieOwner;
 mapping (uint => address)  ownerZombieCount;
Zombie[] public zombies;



function createZombies(string memory _name, uint _dna) private {
   uint Id = zombies.push(Zombie(_name, _dna)) -1;
//for event
   emit NewZombie(Id, _name, _dna);
   zombieToOwner[Id] = msg.sender;
   onerZombieCount[msg.sender]++;
}  
function _generateRandomDna(string memory _str) private view returns(int){
   uint rand = uint(keccak256(abi.encodePacked(_str)));
    return rand % danModulus;
} 
function createRandomZombie(string memory _name) public{
  require(ownerZombieCount[msg.sender] == 0);
  uint randDna = _generateRandomDna(_name);
  _createZombie = (_name ranDna);
}


}
