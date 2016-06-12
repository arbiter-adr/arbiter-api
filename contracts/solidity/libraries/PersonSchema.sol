/*

2015-2016 Ryan Michael Tate

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

library PersonSchema {
    struct Person {
        string familyName; // i.e. Last name
        string givenName; // i.e. First name
        string alternateName;
        string prefix;
        string suffix;
        uint birthDate; // unix timestamp
        bool registered;
        address primaryEthereumAddress;
        address alternateEthereumAddress;
    }

    struct Data {
        mapping(address => Person) person;
    }

    function newPerson(
        Data storage self,
        string _familyName,
        string _givenName,
        string _alternateName,
        string _prefix,
        string _suffix,
        uint _birthDate) returns (bool) {
        if (self.person[msg.sender].registered){
            return false;
        } else {
            self.person[msg.sender].familyName = _familyName;
            self.person[msg.sender].givenName = _givenName;
            self.person[msg.sender].alternateName = _alternateName;
            self.person[msg.sender].prefix = _prefix;
            self.person[msg.sender].suffix = _suffix;
            self.person[msg.sender].birthDate = _birthDate;
            self.person[msg.sender].primaryEthereumAddress = msg.sender;
            self.person[msg.sender].registered = true;

            return true;
        }
    }

    function addAlternateEthereumAddress(Data storage self, address _alternateEthereumAddress) returns (bool){
        if (!self.person[msg.sender].registered || !self.person[_alternateEthereumAddress].registered){
            return false;
        } else {
            // Set alternate address for current address;
            self.person[msg.sender].alternateEthereumAddress = _alternateEthereumAddress;

            // Copy Person Data to alternateAddress;
            self.person[_alternateEthereumAddress] = self.person[msg.sender];

            // Switch prim/alt addresses for copy;
            self.person[_alternateEthereumAddress].primaryEthereumAddress = _alternateEthereumAddress;
            self.person[_alternateEthereumAddress].alternateEthereumAddress = msg.sender;
            return true;
        }
    }

    function updateFamilyName(Data storage self, string _familyName) isRegistered(self) returns (bool){
        self.person[msg.sender].familyName = _familyName;
        return true;
    }

    function updateGivenName(Data storage self, string _givenName) isRegistered(self) returns (bool){
        self.person[msg.sender].givenName = _givenName;
        return true;
    }

    function updateAlternateName(Data storage self, string _alternateName) isRegistered(self) returns (bool){
        self.person[msg.sender].alternateName = _alternateName;
        return true;
    }


    function updatePrefix(Data storage self, string _prefix) isRegistered(self) returns (bool){
        self.person[msg.sender].prefix = _prefix;
        return true;
    }

    function updateSuffix(Data storage self, string _suffix) isRegistered(self) returns (bool){
        self.person[msg.sender].suffix = _suffix;
        return true;
    }

    // function updateBirthDate(Data storage self, uint _birthDate) isRegistered(self) returns (bool){
    //     self.person[msg.sender].birthDate = _birthDate;
    //     return true;
    // }

    function deletePerson(Data storage self) isRegistered(self) returns (bool){
        delete self.person[msg.sender];
        return true;
    }

    function getPerson(Data storage self, address _person) internal returns (Person){
        return self.person[_person];
    }

    modifier isRegistered(Data storage self){
        if(!self.person[msg.sender].registered){
            throw;
        } _
    }

}
