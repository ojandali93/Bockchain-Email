pragma solidity ^0.5.0;

contract Email {
  event newEmail(address indexed from, uint timestamp, string content, string subject)

  struct Email {
    address waver;
    string content;
    string subject;
    uint timestamp;
  }

  Emails[] emails;

  function sendEmail(string calldata _content, string calldata _subject) public {
    uint contentLength = bytes(_content).length;
    uint subjectLength = bytes(_subject).length;
    require(contentLength > 0, "Don't forget to add email content!");
    require(subjectLength > 0, "Don't forget to add a subject!");
    emails.push(Email(msg.sender, _content, _subject, block.timestamp));
    emit newEmail(msg.sender, block.timestamp, _content, _subject)
  }

  function getEmails() view public returns (Emails[] memory) {
    return emails;
  }

}