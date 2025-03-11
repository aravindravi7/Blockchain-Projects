# Decentralized KYC System

## Overview
This project is a **decentralized KYC (Know Your Customer) system** built on the Ethereum blockchain using **Solidity**. The project was developed as part of the **IIT Kanpur Blockchain Professional Certificate** and aims to provide a **trustless, secure, and transparent** mechanism for financial institutions to perform KYC verification.

## Purpose
Traditional KYC processes are often **time-consuming, expensive, and redundant** as different financial institutions perform KYC for the same customers independently. A **blockchain-based KYC system** eliminates this redundancy by allowing banks to share KYC-verified customer data securely and transparently.

## Key Features
- **Admin-Controlled Governance:**
  - The contract has an **admin** who manages the onboarding and permissions of banks.
  - Admin can **add, allow, or block** banks from adding customers or performing KYC.

- **Bank Registration:**
  - Only the admin can **register a bank** in the system.
  - Registered banks are stored in a mapping with their Ethereum address and name.

- **Customer Data Management:**
  - Banks can add new customer details.
  - Customer information is stored in a **mapping**, ensuring **privacy and security**.

- **Decentralized KYC Verification:**
  - Banks can request **KYC verification** for registered customers.
  - The KYC status is stored on the blockchain and can be accessed securely.

## Smart Contract Functions
### Admin Functions
1. `addNewBank(string memory _bankName, address _bankAddr)`
   - Registers a new bank.

2. `allowBankFromKYC(address _bankAddr)`
   - Allows a bank to perform KYC.

3. `blockBankFromKYC(address _bankAddr)`
   - Blocks a bank from performing KYC.

4. `allowBankFromAddingNewCustomers(address _bankAddr)`
   - Allows a bank to add customers.

5. `blockBankFromAddingNewCustomers(address _bankAddr)`
   - Blocks a bank from adding customers.

### Bank Functions
6. `addNewCustomerToBank(string memory _custName, string memory _custData)`
   - Adds a new customer’s details to the system.

7. `addNewCustomerRequestForKYC(string memory _custName)`
   - Requests KYC verification for a registered customer.

8. `viewCustomerData(string memory _custName)`
   - Retrieves a customer’s data and KYC status.

## Advantages of Blockchain-Based KYC
- **Eliminates redundancy**: Once KYC is done, other banks can rely on the existing data.
- **Security & Transparency**: Immutable records ensure data integrity.
- **Reduced costs**: Minimizes repeated KYC checks by different banks.
- **Trustless verification**: Banks can verify a customer's KYC status without relying on a third party.

## Future Enhancements
- Implementing **role-based access** to further secure customer data.
- Integrating **Zero-Knowledge Proofs (ZKP)** for enhanced **privacy**.
- Enabling **multi-signature approvals** for customer onboarding.
- Creating a **user interface (UI)** for better accessibility

## License
This project is licensed under the **MIT License**.

---
Developed as part of the **IIT Kanpur Blockchain Professional Certificate**.


# REMIX DEFAULT WORKSPACE  

Remix default workspace is present when:  
1. Remix loads for the very first time.  
2. A new workspace is created with the **'Default'** template.  
3. There are no files existing in the **File Explorer**.  

## Workspace Structure  

This workspace contains **three directories**:  

- **`contracts/`**: Holds three contracts with increasing levels of complexity.  
- **`scripts/`**: Contains four TypeScript files to deploy a contract (explained below).  
- **`tests/`**: Contains one Solidity test file for the `Ballot` contract & one JS test file for the `Storage` contract.  

## SCRIPTS  

The **`scripts/`** folder contains four TypeScript files that help deploy the `Storage` contract using the **`web3.js`** and **`ethers.js`** libraries.  

### Deploying Other Contracts  
To deploy any other contract:  
- Update the contract name from **`Storage`** to the desired contract.  
- Provide the required constructor arguments in either:  
  - `deploy_with_ethers.ts`  
  - `deploy_with_web3.ts`  

### Running a Script  
1. Navigate to the **`scripts/`** folder.  
2. **Right-click** on the script file in the **File Explorer**.  
3. Click **'Run'**.  
4. Ensure that the Solidity file has already been compiled before running the script.  
5. The output from the script will appear in the **Remix terminal**.  

## Tests  

The **`tests/`** folder contains Mocha-Chai unit tests for the `Storage` contract.  

## Module Support  

Remix **supports** a limited number of modules for `require/import`:  
✅ **Supported modules:**  
- `ethers`, `web3`, `swarmgw`, `chai`, `multihashes`, `remix`, and `hardhat` (only for `hardhat.ethers` object/plugin).  

❌ **Unsupported modules:**  
- If a module is not supported, an error like the following will be displayed:  
