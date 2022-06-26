require('@nomiclabs/hardhat-waffle');

module.exports = {
  solidity:'0.8.0',
  networks:{
    local:{
      url: 'http://127.0.0.1:7545',
      accounts:['d099edf7b62e8b6250e77859f95dfc84e2a5716135648b673af2661609548bb1']
    }
  }
}