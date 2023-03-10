import '../views/screens/regions/models/regions_model.dart';

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
