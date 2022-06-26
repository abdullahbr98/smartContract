const hre = require("hardhat");

const main = async () =>{

  // We get the contract to deploy
  const Balances = await hre.ethers.getContractFactory("Balances");
  const balances = await Balances.deploy();
  await balances.deployed();
  console.log("balances deployed to:", balances.address);


  const Authenticate = await hre.ethers.getContractFactory("Authenticate");
  const authenticate = await Authenticate.deploy();
  await authenticate.deployed();
  console.log("authenticate deployed to:", authenticate.address);

  const Products = await hre.ethers.getContractFactory("Products");
  const products = await Products.deploy();
  await products.deployed();
  console.log("products deployed to:", products.address);



  const Transaction = await hre.ethers.getContractFactory("Transaction");
  const transaction = await Transaction.deploy(balances.address,products.address);
  await transaction.deployed();
  console.log("transaction deployed to:", transaction.address);

  const TransactProducts = await hre.ethers.getContractFactory("TransactProducts");
  const transactProducts = await TransactProducts.deploy(balances.address,products.address);
  await transactProducts.deployed();
  console.log("transactProducts deployed to:", transactProducts.address);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.

const runMain = async()=>{
  try {
    await main()
    process.exit(0)
  } catch (error) {
    console.log(error)
    process.exit(1)
  }
}

runMain()