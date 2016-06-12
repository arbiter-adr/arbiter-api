contract Dispute {

    struct Claimant {

    }

    // struct Respondent {
    //     address ethereumAddress;
    //     string email;
    // }


    struct Claim {
        Claimant claimant; // Exactly One claimaint per Dispute (two disputes against same person if multiple, resolved separately);
        // Respondent[] respondent;
        string purpose;

    }

    function Dispute(){}

}
