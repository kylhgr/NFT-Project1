const main = async () => {
  const nftContractFactory = await hre.ethers.getContractFactory('MyEpicNFT');
  const nftContract = await nftContractFactory.deploy();
  await nftContract.deployed();
  console.log("Contract deployed to:", nftContract.address)

  //calls functions
  let txn = await nftContract.makeAnEpicNFT()
  //wait for mint 
  await txn.wait()
  console.log("Minted NFT #1")
  //2nd attempt to mint
  txn = await nftContract.makeAnEpicNFT()
  //wait to confirm mint
  await txn.wait()
  console.log("Minted NFT #2")

};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();