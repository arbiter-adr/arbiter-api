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

library ContactPointSchema {

    struct ContactPoint {
        string phoneNumber;
        string email;
        string faxNumber;
        string skype;
        bool registered;
        bool emailVerified;
        bool phoneNumberVerified;
    }

    struct Data {
        mapping(address => ContactPoint) primaryContactPoint;
        mapping(address => ContactPoint) alternateContactPoint;
    }

    function addPrimaryContactPoint(Data storage self, string _phoneNumber,
        string _email, string _faxNumber, string _skype) returns (bool){

        self.primaryContactPoint[msg.sender].phoneNumber = _phoneNumber;
        self.primaryContactPoint[msg.sender].email = _email;
        self.primaryContactPoint[msg.sender].faxNumber = _faxNumber;
        self.primaryContactPoint[msg.sender].skype = _skype;

        self.primaryContactPoint[msg.sender].registered = true;
        self.primaryContactPoint[msg.sender].emailVerified = false;
        self.primaryContactPoint[msg.sender].phoneNumberVerified = false;
        return true;
    }

    function addAlternateContactPoint(Data storage self, string _phoneNumber,
        string _email, string _faxNumber, string _skype) returns (bool){

        self.alternateContactPoint[msg.sender].phoneNumber = _phoneNumber;
        self.alternateContactPoint[msg.sender].email = _email;
        self.alternateContactPoint[msg.sender].faxNumber = _faxNumber;
        self.alternateContactPoint[msg.sender].skype = _skype;

        self.alternateContactPoint[msg.sender].registered = true;
        self.alternateContactPoint[msg.sender].emailVerified = false;
        self.alternateContactPoint[msg.sender].phoneNumberVerified = false;
        return true;
    }

    function updatePhoneNumber(Data storage self, bool _primary, string _phoneNumber) contactPointExists(self) public returns (bool){
        if(_primary){
          self.primaryContactPoint[msg.sender].phoneNumber = _phoneNumber;
          return true;
        } else {
          self.alternateContactPoint[msg.sender].phoneNumber = _phoneNumber;
          return true;
        }
    }

    function updateEmail(Data storage self, bool _primary, string _email) contactPointExists(self) public returns (bool){
        if(_primary){
          self.primaryContactPoint[msg.sender].email = _email;
          return true;
        } else {
          self.alternateContactPoint[msg.sender].email = _email;
          return true;
        }
    }

    function updateFaxNumber(Data storage self, bool _primary, string _faxNumber) contactPointExists(self) public returns (bool){
        if(_primary){
          self.primaryContactPoint[msg.sender].faxNumber = _faxNumber;
          return true;
        } else {
          self.alternateContactPoint[msg.sender].faxNumber = _faxNumber;
          return true;
        }
    }

    function updateSkype(Data storage self, bool _primary, string _skype) contactPointExists(self) public returns (bool){
        if(_primary){
          self.primaryContactPoint[msg.sender].skype = _skype;
          return true;
        } else {
          self.alternateContactPoint[msg.sender].skype = _skype;
          return true;
        }
    }

    modifier contactPointExists(Data storage self){
        if(self.primaryContactPoint[msg.sender].registered || self.alternateContactPoint[msg.sender].registered){
            _
        } else {
            throw;
        }
    }

}
