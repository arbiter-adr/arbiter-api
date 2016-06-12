library PostalAddressSchema {

  struct PostalAddress {
    string addressCountry; // USA (Alpha-3 Code)
    string addressLocality; // Seattle
    string addressRegion; // WA
    string postOfficeBoxNumber; // (optional)
    string postalCode; // 98052
    string streetAddress; // 20341 Whitworth Institute 405 N. Whitworth
    bool registered;
    bool verified; // POPA plugin; Event system.
  }

  struct Data {
    mapping(address => PostalAddress) primaryAddress;
    mapping(address => PostalAddress) alternateAddress;
  }

  function addAddress(Data storage self, bool _primary, string _addressCountry,
    string _addressLocality, string _addressRegion, string _postOfficeBoxNumber,
    string _postalCode, string _streetAddress) returns (bool){

      if(_primary){
        self.primaryAddress[msg.sender].addressCountry = _addressCountry;
        self.primaryAddress[msg.sender].addressLocality = _addressLocality;
        self.primaryAddress[msg.sender].addressRegion = _addressRegion;
        self.primaryAddress[msg.sender].postOfficeBoxNumber = _postOfficeBoxNumber;
        self.primaryAddress[msg.sender].postalCode = _postalCode;
        self.primaryAddress[msg.sender].streetAddress = _streetAddress;
        self.primaryAddress[msg.sender].registered = true;
        self.primaryAddress[msg.sender].verified = false;
        return true;
      } else {
        self.alternateAddress[msg.sender].addressCountry = _addressCountry;
        self.alternateAddress[msg.sender].addressLocality = _addressLocality;
        self.alternateAddress[msg.sender].addressRegion = _addressRegion;
        self.alternateAddress[msg.sender].postOfficeBoxNumber = _postOfficeBoxNumber;
        self.alternateAddress[msg.sender].postalCode = _postalCode;
        self.alternateAddress[msg.sender].streetAddress = _streetAddress;
        self.alternateAddress[msg.sender].registered = true;
        self.alternateAddress[msg.sender].verified = false;
        return true;
      }
  }

  function updateAddressCountry(Data storage self, bool _primary, string _addressCountry) addressExistsForEntity(self) public returns(bool){
      if(_primary){
        self.primaryAddress[msg.sender].addressCountry = _addressCountry;
        return true;
      } else {
        self.alternateAddress[msg.sender].addressCountry = _addressCountry;
        return true;
      }
  }

  function updateAddressLocality(Data storage self, bool _primary, string _addressLocality) addressExistsForEntity(self) public returns(bool){
      if(_primary){
        self.primaryAddress[msg.sender].addressLocality = _addressLocality;
        return true;
      } else {
        self.alternateAddress[msg.sender].addressLocality = _addressLocality;
        return true;
      }
  }

  function updateAddressRegion(Data storage self, bool _primary, string _addressRegion) addressExistsForEntity(self) public returns(bool){
      if(_primary){
        self.primaryAddress[msg.sender].addressRegion = _addressRegion;
        return true;
      } else {
        self.alternateAddress[msg.sender].addressRegion = _addressRegion;
        return true;
      }
  }

  function updatePostOfficeBoxNumber(Data storage self, bool _primary, string _postOfficeBoxNumber) addressExistsForEntity(self) public returns(bool){
      if(_primary){
        self.primaryAddress[msg.sender].postOfficeBoxNumber = _postOfficeBoxNumber;
        return true;
      } else {
        self.alternateAddress[msg.sender].postOfficeBoxNumber = _postOfficeBoxNumber;
        return true;
      }
  }

  function updatePostalCode(Data storage self, bool _primary, string _postalCode) addressExistsForEntity(self) public returns(bool){
      if(_primary){
        self.primaryAddress[msg.sender].postalCode = _postalCode;
        return true;
      } else {
        self.alternateAddress[msg.sender].postalCode = _postalCode;
        return true;
      }
  }

  function updateStreetAddress(Data storage self, bool _primary, string _streetAddress) addressExistsForEntity(self) public returns(bool){
      if(_primary){
        self.primaryAddress[msg.sender].streetAddress = _streetAddress;
        return true;
      } else {
        self.alternateAddress[msg.sender].streetAddress = _streetAddress;
        return true;
      }
  }

  function getPostalAddress(Data storage self, bool _primary, address entity) internal returns (PostalAddress){
      if(_primary){
        return self.primaryAddress[entity];
      } else {
        return self.alternateAddress[entity];
      }
  }

  modifier addressExistsForEntity(Data storage self){
    if(self.primaryAddress[msg.sender].registered || self.alternateAddress[msg.sender].registered){
        _
    } else {
        throw;
    }
  }

}
