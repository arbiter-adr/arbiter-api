library Claim {
    using CostSchema for CostSchema.Data;
    CostSchema.Data Cost;


    struct Details {
        string shortDescription; // What is this claim about?
        string desiredRelief; // What is the outcome/relief sought from this claim?
        uint settlementValue; // Maximum amount if paid will settle.
        address[] counterParties;
        address issuingParty;
        uint dateIssued;
    }

    struct Result {
        bool voluntarilyDropped;
        bool settled;
        bool arbitratorDecision; // outcome/favor/etc...
        uint dateSettled;
        uint dateFinalized;
    }


    // Losing party should be responsible, within reason, of the winning party's
    // costs incurred during the dispute.

    struct Documents {
        bytes32[] ipfsHash;
    }

    address public contractAddress;
    bool public active;
    Details public details;
    Result public result;
    // Documents public documents;


    function Claim(string _shortDescription, string _desiredRelief, uint _settlementValue){

        active = true;
        contractAddress = address(this);


        details.shortDescription = _shortDescription;
        details.desiredRelief = _desiredRelief;
        details.settlementValue = _settlementValue;
    }

    function settleClaim(bool ) public returns(bool){

    }


}
