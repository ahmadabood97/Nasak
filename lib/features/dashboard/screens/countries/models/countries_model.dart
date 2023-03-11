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

class Cities {
  String? name;
  bool? cityAvalible;
  String? countryGuid;
  int? displayOrder;
  dynamic latcoordinates;
  dynamic loncoordinates;
  bool? isDeliveryAvalible;
  dynamic cityCountry;
  List<Regions>? regions;
  dynamic locatoinInfo;
  String? id;
  dynamic createdBy;
  String? createdOnUtc;
  dynamic lastModifiedBy;
  dynamic lastModifiedOnUtc;
  dynamic ipAddress;
  bool? isDeleted;

  Cities(
      {this.name,
      this.cityAvalible,
      this.countryGuid,
      this.displayOrder,
      this.latcoordinates,
      this.loncoordinates,
      this.isDeliveryAvalible,
      this.cityCountry,
      this.regions,
      this.locatoinInfo,
      this.id,
      this.createdBy,
      this.createdOnUtc,
      this.lastModifiedBy,
      this.lastModifiedOnUtc,
      this.ipAddress,
      this.isDeleted});

  Cities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cityAvalible = json['cityAvalible'];
    countryGuid = json['countryGuid'];
    displayOrder = json['displayOrder'];
    latcoordinates = json['latcoordinates'];
    loncoordinates = json['loncoordinates'];
    isDeliveryAvalible = json['isDeliveryAvalible'];
    cityCountry = json['cityCountry'];
    if (json['regions'] != null) {
      regions = <Regions>[];
      json['regions'].forEach((v) {
        regions!.add(Regions.fromJson(v));
      });
    }
    locatoinInfo = json['locatoinInfo'];
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
    data['cityAvalible'] = cityAvalible;
    data['countryGuid'] = countryGuid;
    data['displayOrder'] = displayOrder;
    data['latcoordinates'] = latcoordinates;
    data['loncoordinates'] = loncoordinates;
    data['isDeliveryAvalible'] = isDeliveryAvalible;
    data['cityCountry'] = cityCountry;
    if (regions != null) {
      data['regions'] = regions!.map((v) => v.toJson()).toList();
    }
    data['locatoinInfo'] = locatoinInfo;
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

class Regions {
  String? name;
  bool? regionAvalible;
  String? cityGuid;
  String? countryGuid;
  int? displayOrder;
  dynamic latcoordinates;
  dynamic loncoordinates;
  bool? isDeliveryAvalible;
  dynamic regioncity;
  dynamic regionCountry;
  dynamic deliveryRegions;
  dynamic locatoinInfo;
  String? id;
  dynamic createdBy;
  String? createdOnUtc;
  dynamic lastModifiedBy;
  dynamic lastModifiedOnUtc;
  dynamic ipAddress;
  bool? isDeleted;

  Regions(
      {this.name,
      this.regionAvalible,
      this.cityGuid,
      this.countryGuid,
      this.displayOrder,
      this.latcoordinates,
      this.loncoordinates,
      this.isDeliveryAvalible,
      this.regioncity,
      this.regionCountry,
      this.deliveryRegions,
      this.locatoinInfo,
      this.id,
      this.createdBy,
      this.createdOnUtc,
      this.lastModifiedBy,
      this.lastModifiedOnUtc,
      this.ipAddress,
      this.isDeleted});

  Regions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    regionAvalible = json['regionAvalible'];
    cityGuid = json['cityGuid'];
    countryGuid = json['countryGuid'];
    displayOrder = json['displayOrder'];
    latcoordinates = json['latcoordinates'];
    loncoordinates = json['loncoordinates'];
    isDeliveryAvalible = json['isDeliveryAvalible'];
    regioncity = json['regioncity'];
    regionCountry = json['regionCountry'];
    deliveryRegions = json['deliveryRegions'];
    locatoinInfo = json['locatoinInfo'];
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
    data['regionAvalible'] = regionAvalible;
    data['cityGuid'] = cityGuid;
    data['countryGuid'] = countryGuid;
    data['displayOrder'] = displayOrder;
    data['latcoordinates'] = latcoordinates;
    data['loncoordinates'] = loncoordinates;
    data['isDeliveryAvalible'] = isDeliveryAvalible;
    data['regioncity'] = regioncity;
    data['regionCountry'] = regionCountry;
    data['deliveryRegions'] = deliveryRegions;
    data['locatoinInfo'] = locatoinInfo;
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
