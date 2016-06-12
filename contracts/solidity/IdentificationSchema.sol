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

library IdentificationSchema {

    struct Identification {
        string idType; // e.g. taxID, NIN (National Identification Number, "SSN", "Drivers License"), duns
        string idValue;
    }

    struct Data {
        mapping(address => mapping(string => Identification)) ID;
    }

    function addIdentification(Data storage self, string _idType, string _idValue) public returns (bool){
        self.ID[msg.sender][_idType].idType = _idType;
        self.ID[msg.sender][_idType].idValue = _idValue;
        return true;
    }

    function updateIdentification(Data storage self, string _idType, string _idValue) public returns(bool){
        self.ID[msg.sender][_idType].idValue = _idValue;
        return true;
    }

    function getIdentification(Data storage self, address _person, string _idType) internal returns(string _idValue){
        return self.ID[_person][_idType].idValue;
    }

}
