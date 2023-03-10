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
