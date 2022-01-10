const hre = require('hardhat')

async function main () {
  const nftContractFactory = await hre.ethers.getContractFactory('FrancosionNFT')
  const nftContract = await nftContractFactory.deploy()
  await nftContract.deployed()
  console.log('Contract deployed to:', nftContract.address)

  // Call the function.
  let txn = await nftContract.mintNFT()
  // Wait for it to be mined.
  await txn.wait()

  // Mint another NFT for fun.
  txn = await nftContract.mintNFT()
  // Wait for it to be mined.
  await txn.wait()
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
