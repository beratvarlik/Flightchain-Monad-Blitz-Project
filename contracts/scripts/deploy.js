import hardhat from "hardhat";

async function main() {
  console.log("Deploying AirlineTicket contract...");
  const hre = hardhat;
  
  const AirlineTicket = await hre.ethers.getContractFactory("AirlineTicket");
  const airlineTicket = await AirlineTicket.deploy();

  await airlineTicket.waitForDeployment();
  const address = await airlineTicket.getAddress();

  console.log("AirlineTicket deployed to:", address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
