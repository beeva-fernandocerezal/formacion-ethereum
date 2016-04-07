contract Question {
    address creator;
    bytes32 question;
    enum Choices { Yes, No, NotResponse }
    mapping(address => Choices) responses;
    address[] addrResponses;

    function Question(bytes32 _question) {
      creator = msg.sender;
      question = _question;
    }

    function setResponse(bytes32 response) {
      bool addrExists = false;
      for (var i=0;i<addrResponses.length;i++) {
        if (addrResponses[i] == msg.sender) {
          addrExists = true;
          break;
        }
      }

      if (addrExists == false) {
        addrResponses.push(msg.sender);

        if (response == "yes") {
          responses[msg.sender] = Choices.Yes;
        } else if (response == "no") {
          responses[msg.sender] = Choices.No;
        } else {
          responses[msg.sender] = Choices.NotResponse;
        }
      }
    }

    function getQuestion() returns (bytes32 _question) {
      return question;
    }

    function getNumResponses() returns (uint256 numResponses) {
      return addrResponses.length;
    }

    function getResponses() returns (uint16 _numYes, uint16 _numNo, uint16 _numNotResponse) {
      uint16 numYes = 0;
      uint16 numNo = 0;
      uint16 numNotResponse = 0;

      for (var i=0;i<addrResponses.length;i++) {
        if (responses[addrResponses[i]] == Choices.Yes) {
          numYes = numYes +1;
        } else if (responses[addrResponses[i]] == Choices.No) {
          numNo = numNo +1;
        } else if (responses[addrResponses[i]] == Choices.NotResponse) {
          numNotResponse = numNotResponse +1;
        }
      }

      return (numYes, numNo, numNotResponse);
    }

    function kill() {
      if (msg.sender == creator) {
        suicide(creator);
      }
    }

}
