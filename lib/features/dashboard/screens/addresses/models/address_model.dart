class AddressModel {
  String? addressName;
  String? clientGuid;
  String? countryGuid;
  String? cityGuid;
  String? regionGuid;
  String? userAddress;
  String? addressExtraDesc;
  String? phonenumber;
  String? firstname;
  String? lastname;
  String? locLat;
  String? locLong;
  String? buildName;
  String? floorNum;
  String? entranceNum;

  AddressModel(
      {this.addressName,
      this.clientGuid,
      this.countryGuid,
      this.cityGuid,
      this.regionGuid,
      this.userAddress,
      this.addressExtraDesc,
      this.phonenumber,
      this.firstname,
      this.lastname,
      this.locLat,
      this.locLong,
      this.buildName,
      this.floorNum,
      this.entranceNum});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressName = json['addressName'];
    clientGuid = json['clientGuid'];
    countryGuid = json['countryGuid'];
    cityGuid = json['cityGuid'];
    regionGuid = json['regionGuid'];
    userAddress = json['userAddress'];
    addressExtraDesc = json['addressExtraDesc'];
    phonenumber = json['phonenumber'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    locLat = json['locLat'];
    locLong = json['locLong'];
    buildName = json['buildName'];
    floorNum = json['floorNum'];
    entranceNum = json['entranceNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressName'] = addressName;
    data['clientGuid'] = clientGuid;
    data['countryGuid'] = countryGuid;
    data['cityGuid'] = cityGuid;
    data['regionGuid'] = regionGuid;
    data['userAddress'] = userAddress;
    data['addressExtraDesc'] = addressExtraDesc;
    data['phonenumber'] = phonenumber;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['locLat'] = locLat;
    data['locLong'] = locLong;
    data['buildName'] = buildName;
    data['floorNum'] = floorNum;
    data['entranceNum'] = entranceNum;
    return data;
  }
}
