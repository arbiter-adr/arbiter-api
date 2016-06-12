library CostSchema {

    struct Cost {
        bytes32 costType; // e.g. gasCost
        uint value; // value of gas
        string description;
    }

    struct Data {
        mapping(bytes32 => Cost) costs;
    }

    function addCost(Data storage self, bytes32 _costType, uint _value, string _description) public returns(bool){
        self.costs[_costType].costType = _costType;
        self.costs[_costType].value = _value;
        self.costs[_costType].description = _description;

        return true;
    }

}
