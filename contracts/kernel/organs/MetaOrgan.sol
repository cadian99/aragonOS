pragma solidity ^0.4.8;

import "./Organ.sol";

contract MetaOrgan is Organ {
  function ceaseToExist() {
    selfdestruct(0xdead);
  }

  function replaceKernel(address newKernel) {
    kernel = newKernel;
  }

  function replaceOrgan(address organAddress, uint organN) {
    organs[organN] = organAddress;
    OrganReplaced(organAddress, organN);
  }

  function canHandlePayload(bytes payload) returns (bool) {
    bytes4 sig = getFunctionSignature(payload);
    return
      sig == 0x5bb95c74 || // ceaseToExist()
      sig == 0xcebe30ac || // replaceKernel(address)
      sig == 0x53900d7a;   // replaceOrgan(address,uint256)
  }
}
