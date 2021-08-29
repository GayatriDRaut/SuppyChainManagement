const { assert } = require("console");

const itemManager = artifacts.require("./ItemManager.sol");
contract ("ItemManager", accounts=>{
 it("it should be able to add items", async function(){
     const itemManagerInstance = await itemManager.deployed();
     const itemName ="test1";
     const itemPrice = 500;
     const result= await itemManagerInstance.createItem(itemName, itemPrice, {from : accounts[0]});
     assert.equal(result.logs[0].args._itemIndex, 0, "it is not the first item");

     const item =  await itemManagerInstance.items(0);
     assert.equal(item._idetifier, itemName , "the identifier was different");
})
});