# Flightchain: NFT-Based Flight Ticketing System on Monad

Welcome to **Flightchain**, a next-generation decentralized application (dApp) designed to revolutionize the travel industry by transforming flight tickets into unique, verifiable **NFTs**. Built on the high-performance **Monad Testnet**, this project ensures that every ticket is personalized, secure, and easily manageable through blockchain technology.

## 🚀 The Vision
Traditional ticketing systems are often fragmented, opaque, and prone to fraud. By minting tickets as NFTs, we provide:
* **Proof of Ownership:** Immutable record of travel rights.
* **Personalization:** Custom metadata attached to each ticket for loyalty rewards and passenger-specific perks.
* **Secondary Market Control:** Smart contracts that regulate or prevent unauthorized ticket reselling.
* **Efficiency:** Instant settlement and low-latency transactions powered by **Monad**.

## 🛠 Tech Stack
I have architected this project using a modern, scalable stack to ensure both developer productivity and end-user performance:

* **Blockchain:** [Monad Testnet](https://www.monad.xyz/) (EVM-compatible, ultra-high performance).
* **Smart Contracts:** Solidity (OpenZeppelin standards for NFT minting).
* **Frontend:** Next.js 14 (App Router) with TypeScript for robust, type-safe development.
* **Styling:** Tailwind CSS for a modern, responsive UI.
* **State Management & Hooks:** Wagmi & Viem for seamless blockchain interactions.
* **Development Environment:** Hardhat / Foundry for contract testing and deployment.

## 📂 Project Structure
* `/contracts`: Solidity smart contracts for the NFT ticketing logic.
* `/frontend`: Next.js application providing the passenger dashboard and booking interface.
* `/src`: Reusable UI components and blockchain utility functions.

## 🛡 Features
- **Dynamic Minting:** Tickets are minted as NFTs upon successful booking.
- **Identity Verification:** Optional integration for identity-linked (Soulbound) tickets to prevent scalping.
- **Monad Integration:** Optimized for Monad’s parallel execution to handle high-volume ticket sales during peak seasons.

## 🛠 Getting Started

### Prerequisites
- Node.js (v18+)
- A wallet configured for Monad Testnet

### Installation
1. Clone the repository:
   ```bash
   git clone [https://github.com/beratvarlik/Flightchain-Monad-Blitz-Project.git]
