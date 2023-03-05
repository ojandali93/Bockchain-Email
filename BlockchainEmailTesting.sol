pragma solidity 0.8.7;

import "./BlockchainEmail.sol";

contract EmailChainTest {
  BlockChainEmail emailToTest;

  function beforeAll () public {
    emailToTest = new Email();
  }
function checkSendEmail () public {
    emailToTest.sendEmail("First Email!", "Hello World!");

    Assert.equal(emailToTest.getMessages().length, uint(1), "messages state variable should contain 1 message");

    Assert.equal(emailToTest.getMessages()[0].subject, string("First Email!"), "The first Message in message should be \"First Email\"");

    Assert.equal(emailToTest.getMessages()[0].content, string("Hello World!"), "The first Message in message should be \"Hello World!\"");

    emailToTest.sendMessage("Event Confirmation", "This is a confirmation email for your plane flight.");

    Assert.equal(emailToTest.getMessages().length, uint(2), "messages state variable should contain 2 messages");
  }
}