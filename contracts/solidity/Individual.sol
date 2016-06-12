/*

Example Solidity Browser Request:


"Tate", "Ryan", "Ryanmtate", "Mr.", "N/A", "621081720", "USA", "Tacoma", "WA", "N/A", "98404", "612 E. 35th St."

*/



import "PersonSchema.sol";
import "PostalAddressSchema.sol";
import "ContactPointSchema.sol";
import "IdentificationSchema.sol";

contract Individual {

  using PersonSchema for PersonSchema.Data;
  PersonSchema.Data Person;

  using PostalAddressSchema for PostalAddressSchema.Data;
  PostalAddressSchema.Data PostalAddress;

  using ContactPointSchema for ContactPointSchema.Data;
  ContactPointSchema.Data Contact;

  using IdentificationSchema for IdentificationSchema.Data;
  IdentificationSchema.Data Identification;

  address public individual;
  address public contractAddress;
  string[] public identifications;
  uint public numIdentifications;

  /* Person CRUD Functions */

  function Individual(string _familyName, string _givenName, string _alternateName,
    string _prefix, string _suffix, uint _birthDate)
  {

    if (!Person.newPerson(_familyName, _givenName, _alternateName,
      _prefix, _suffix, _birthDate))
    {
      throw;
    } else {
      individual = msg.sender;
      contractAddress = address(this);
    }
  }

  function getPerson() public returns(string _familyName, string _givenName,
    string _alternateNate, string _prefix, string _suffix, uint _birthDate,
    address _alternateEthereumAddress)
  {

    return (Person.getPerson(individual).familyName, Person.getPerson(individual).givenName,
      Person.getPerson(individual).alternateName, Person.getPerson(individual).prefix,
      Person.getPerson(individual).suffix, Person.getPerson(individual).birthDate,
      Person.getPerson(individual).alternateEthereumAddress);

  }

  function updateFamilyName(string _familyName) returns (bool){
      return Person.updateFamilyName(_familyName);
  }

  function updateGivenName(string _givenName) returns (bool){
      return Person.updateGivenName(_givenName);
  }

  function updateAlternateName(string _alternateName) returns (bool){
      return Person.updateAlternateName(_alternateName);
  }

  function updatePrefix(string _prefix) returns (bool){
      return Person.updatePrefix(_prefix);
  }

  function updateSuffix(string _suffix) returns (bool){
      return Person.updateSuffix(_suffix);
  }

  function deletePerson() returns (bool){
      return Person.deletePerson();
  }

  /* PostalAddress CRUD Functions */

  function addPostalAddress(bool _primary, string _addressCountry, string _addressLocality,
    string _addressRegion, string _postOfficeBoxNumber, string _postalCode,
    string _streetAddress) public returns (bool){
    return PostalAddress.addAddress(_primary, _addressCountry, _addressLocality,
      _addressRegion, _postOfficeBoxNumber, _postalCode, _streetAddress);
  }

  function getPostalAddress(bool _primary) public returns (string _addressCountry, string _addressLocality,
    string _addressRegion, string _postOfficeBoxNumber, string _postalCode,
    string _streetAddress, bool _verified){
      return (
        PostalAddress.getPostalAddress(_primary, individual).addressCountry,
        PostalAddress.getPostalAddress(_primary, individual).addressLocality,
        PostalAddress.getPostalAddress(_primary, individual).addressRegion,
        PostalAddress.getPostalAddress(_primary, individual).postOfficeBoxNumber,
        PostalAddress.getPostalAddress(_primary, individual).postalCode,
        PostalAddress.getPostalAddress(_primary, individual).streetAddress,
        PostalAddress.getPostalAddress(_primary, individual).verified
        );
  }

  function updateAddressCountry(bool _primary, string _addressCountry) public returns(bool){
      return PostalAddress.updateAddressCountry(_primary, _addressCountry);
  }

  function updateAddressLocality(bool _primary, string _addressLocality) public returns(bool){
      return PostalAddress.updateAddressLocality(_primary, _addressLocality);
  }

  function updateAddressRegion(bool _primary, string _addressRegion) public returns(bool){
      return PostalAddress.updateAddressRegion(_primary, _addressRegion);
  }

  function updatePostOfficeBoxNumber(bool _primary, string _postOfficeBoxNumber) public returns(bool){
      return PostalAddress.updatePostOfficeBoxNumber(_primary, _postOfficeBoxNumber);
  }

  function updatePostalCode(bool _primary, string _postalCode) public returns(bool){
      return PostalAddress.updatePostalCode(_primary, _postalCode);
  }

  function updateStreetAddress(bool _primary, string _streetAddress) public returns(bool){
      return PostalAddress.updateStreetAddress(_primary, _streetAddress);
  }

    /* Identification CRUD functions*/

  function addIdentification(string _idType, string _idValue) public returns(bool){
    if(!Identification.addIdentification(_idType, _idValue)){
      throw;
    } else {
      identifications.push(_idType);
      numIdentifications = identifications.length;
      return true;
    }
  }


  function getIdentification(string _idType) public returns(string _idValue){
    return Identification.getIdentification(individual, _idType);
  }

}
