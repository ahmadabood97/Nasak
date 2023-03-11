class AddressResponseModel {
  String? appVersion;
  String? apiVersion;
  int? statusCode;
  dynamic errorMessage;
  Result? result;

  AddressResponseModel(
      {this.appVersion,
      this.apiVersion,
      this.statusCode,
      this.errorMessage,
      this.result});

  AddressResponseModel.fromJson(Map<String, dynamic> json) {
    appVersion = json['appVersion'];
    apiVersion = json['apiVersion'];
    statusCode = json['statusCode'];
    errorMessage = json['errorMessage'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appVersion'] = appVersion;
    data['apiVersion'] = apiVersion;
    data['statusCode'] = statusCode;
    data['errorMessage'] = errorMessage;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  List<Addersses>? addersses;

  Result({this.addersses});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['addersses'] != null) {
      addersses = <Addersses>[];
      json['addersses'].forEach((v) {
        addersses!.add(Addersses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (addersses != null) {
      data['addersses'] = addersses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addersses {
  String? id;
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
  dynamic addressCountry;
  dynamic addressCity;
  dynamic addressRegion;

  Addersses(
      {this.id,
      this.addressName,
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
      this.entranceNum,
      this.addressCountry,
      this.addressCity,
      this.addressRegion});

  Addersses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    addressCountry = json['addressCountry'];
    addressCity = json['addressCity'];
    addressRegion = json['addressRegion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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
    data['addressCountry'] = addressCountry;
    data['addressCity'] = addressCity;
    data['addressRegion'] = addressRegion;
    return data;
  }
}
