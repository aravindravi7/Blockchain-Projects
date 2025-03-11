// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract KYC {


   address public admin;


   /**
    * @dev Constructor for KYC contract
    * @param _admin address of the KYC contract
    */
   constructor(address _admin)
   {
       admin = _admin;
   }


   mapping (address => string) public banks;
   mapping (string => string) private customers;
   mapping (string => bool) private isKYCDone;
   mapping (address => bool) public isBankBlockedFromAddingCustomer;
   mapping (address => bool) public isBankBlockedFromKYC;


   /**
    @dev modifier to check if the sender is the default admin of KYC contract
    * Revert if the sender is not the admin
    */
   modifier onlyAdmin() {
       require(msg.sender == admin, "KYC: Only Admin");
       _;
   }


   modifier onlyBank() {
       require(bytes(banks[msg.sender]).length > 0, "KYC: Only Bank");
       _;
   }




   function addNewBank(string memory _bankName, address _bankAddr) public onlyAdmin {
       require(bytes(_bankName).length > 0, "Invalid Bank Name.");
       require(_bankAddr != address(0), "Invalid Bank Address.");
       require(bytes(banks[_bankAddr]).length == 0, "Bank already exists.");
       banks[_bankAddr] = _bankName;
   }


   function allowBankFromKYC(address _bankAddr) public onlyAdmin {
       require(_bankAddr != address(0), "Invalid Bank Address.");
       require(bytes(banks[_bankAddr]).length > 0, "Address not registered as bank.");
       isBankBlockedFromKYC[_bankAddr] = false;
   }


   function blockBankFromKYC(address _bankAddr) public onlyAdmin {
       require(_bankAddr != address(0), "Invalid Bank Address.");
       require(bytes(banks[_bankAddr]).length > 0, "Address not registered as bank.");
       isBankBlockedFromKYC[_bankAddr] = true;
   }


   function allowBankFromAddingNewCustomers(address _bankAddr) public onlyAdmin {
       require(_bankAddr != address(0), "Invalid Bank Address.");
       require(bytes(banks[_bankAddr]).length > 0, "Address not registered as bank.");
       isBankBlockedFromAddingCustomer[_bankAddr] = false;
   }


   function blockBankFromAddingNewCustomers(address _bankAddr) public onlyAdmin {
       require(_bankAddr != address(0), "Invalid Bank Address.");
       require(bytes(banks[_bankAddr]).length > 0, "Address not registered as bank.");
       isBankBlockedFromAddingCustomer[_bankAddr] = true;
   }


   function addNewCustomerToBank(string memory _custName, string memory _custData)
   public onlyBank {
       require(bytes(_custName).length > 0, "Invalid Customer Name.");
       require(bytes(_custData).length > 0, "Invalid Customer Data.");
       require(!isBankBlockedFromAddingCustomer[msg.sender], "Bank blocked from adding customers.");
       customers[_custName] = _custData;
   }


   function addNewCustomerRequestForKYC(string memory _custName) public onlyBank {
       require(bytes(_custName).length > 0, "Invalid Customer Name.");
       require(!isBankBlockedFromKYC[msg.sender], "Bank blocked from performing KYC.");
       require(bytes(customers[_custName]).length>0,"Customer Details Not Registered");
       isKYCDone[_custName] = true;
   }


   function viewCustomerData(string memory _custName) public view returns(string memory, bool) {
       return (customers[_custName], isKYCDone[_custName]);
   }
  
}
