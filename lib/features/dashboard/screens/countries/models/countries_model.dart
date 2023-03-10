import '../views/screens/citites/models/cities_model.dart';

class CountriesResponse {
  String? appVersion;
  String? apiVersion;
  int? statusCode;
  String? errorMessage;
  Result? result;

  CountriesResponse(
      {this.appVersion,
      this.apiVersion,
      this.statusCode,
      this.errorMessage,
      this.result});

  CountriesResponse.fromJson(Map<String, dynamic> json) {
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
  List<Countries>? countries;
  dynamic city;
  dynamic country;
  dynamic regionsvm;

  Result({this.countries, this.city, this.country, this.regionsvm});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
    city = json['city'];
    country = json['country'];
    regionsvm = json['regionsvm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (countries != null) {
      data['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    data['city'] = city;
    data['country'] = country;
    data['regionsvm'] = regionsvm;
    return data;
  }
}

class Countries {
  String? name;
  int? displayOrder;
  bool? countryAvalible;
  dynamic latcoordinates;
  dynamic loncoordinates;
  String? currencyId;
  bool? isDeliveryAvalible;
  int? timeZoneOffsetOnUtc;
  List<Cities>? cities;
  dynamic locatoinInfo;
  dynamic currency;
  String? id;
  dynamic createdBy;
  String? createdOnUtc;
  dynamic lastModifiedBy;
  dynamic lastModifiedOnUtc;
  dynamic ipAddress;
  bool? isDeleted;

  Countries(
      {this.name,
      this.displayOrder,
      this.countryAvalible,
      this.latcoordinates,
      this.loncoordinates,
      this.currencyId,
      this.isDeliveryAvalible,
      this.timeZoneOffsetOnUtc,
      this.cities,
      this.locatoinInfo,
      this.currency,
      this.id,
      this.createdBy,
      this.createdOnUtc,
      this.lastModifiedBy,
      this.lastModifiedOnUtc,
      this.ipAddress,
      this.isDeleted});

  Countries.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayOrder = json['displayOrder'];
    countryAvalible = json['countryAvalible'];
    latcoordinates = json['latcoordinates'];
    loncoordinates = json['loncoordinates'];
    currencyId = json['currencyId'];
    isDeliveryAvalible = json['isDeliveryAvalible'];
    timeZoneOffsetOnUtc = json['timeZoneOffsetOnUtc'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
      });
    }
    locatoinInfo = json['locatoinInfo'];
    currency = json['currency'];
    id = json['id'];
    createdBy = json['createdBy'];
    createdOnUtc = json['createdOnUtc'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedOnUtc = json['lastModifiedOnUtc'];
    ipAddress = json['ipAddress'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['displayOrder'] = displayOrder;
    data['countryAvalible'] = countryAvalible;
    data['latcoordinates'] = latcoordinates;
    data['loncoordinates'] = loncoordinates;
    data['currencyId'] = currencyId;
    data['isDeliveryAvalible'] = isDeliveryAvalible;
    data['timeZoneOffsetOnUtc'] = timeZoneOffsetOnUtc;
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    data['locatoinInfo'] = locatoinInfo;
    data['currency'] = currency;
    data['id'] = id;
    data['createdBy'] = createdBy;
    data['createdOnUtc'] = createdOnUtc;
    data['lastModifiedBy'] = lastModifiedBy;
    data['lastModifiedOnUtc'] = lastModifiedOnUtc;
    data['ipAddress'] = ipAddress;
    data['isDeleted'] = isDeleted;
    return data;
  }
}
