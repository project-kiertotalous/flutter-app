class BasicInformationData {
  late String _name;
  late String _buildingType;
  late String _address;
  late String _municipality;
  late String _creator;
  late String _date;
  late String _version;
  late String _additionalInfo;

  void setName(String name) {
    _name = name;
  }

  void setBuildingType(String buildingType) {
    _buildingType = buildingType;
  }

  void setAddress(String address) {
    _address = address;
  }

  void setMunicipality(String municipality) {
    _municipality = municipality;
  }

  void setCreator(String creator) {
    _creator = creator;
  }

  void setDate(String date) {
    _date = date;
  }

  void setVersion(String version) {
    _version = version;
  }

  void setAdditionalInfo(String additionalInfo) {
    _additionalInfo = additionalInfo;
  }

  String get name => _name;
  String get buildingType => _buildingType;
  String get address => _address;
  String get municipality => _municipality;
  String get creator => _creator;
  String get date => _date;
  String get version => _version;
  String get additionalInfo => _additionalInfo;
}
