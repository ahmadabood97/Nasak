class CheckoutModel {
  bool? ispickupOrder;
  String? serviceProiderGuid;
  String? customerGuid;
  OrderDeliveryDateModel? orderDeliveryDateModel;
  OrderDeliveryTimeModel? orderDeliveryTimeModel;
  String? paymentMethodGuid;
  List<OrderItems>? orderItems;
  DeliveryAddress? deliveryAddress;
  String? customerCurrencyCode;
  double? currencyRate;
  String? currencyId;
  String? deliveryUserAddressGuid;

  CheckoutModel(
      {this.ispickupOrder,
      this.serviceProiderGuid,
      this.customerGuid,
      this.orderDeliveryDateModel,
      this.orderDeliveryTimeModel,
      this.paymentMethodGuid,
      this.orderItems,
      this.deliveryAddress,
      this.customerCurrencyCode,
      this.currencyRate,
      this.currencyId,
      this.deliveryUserAddressGuid});

  CheckoutModel.fromJson(Map<String, dynamic> json) {
    ispickupOrder = json['ispickupOrder'];
    serviceProiderGuid = json['serviceProiderGuid'];
    customerGuid = json['customerGuid'];
    orderDeliveryDateModel = json['OrderDeliveryDateModel'] != null
        ? OrderDeliveryDateModel.fromJson(json['OrderDeliveryDateModel'])
        : null;
    orderDeliveryTimeModel = json['OrderDeliveryTimeModel'] != null
        ? OrderDeliveryTimeModel.fromJson(json['OrderDeliveryTimeModel'])
        : null;
    paymentMethodGuid = json['paymentMethodGuid'];
    if (json['orderItems'] != null) {
      orderItems = <OrderItems>[];
      json['orderItems'].forEach((v) {
        orderItems!.add(OrderItems.fromJson(v));
      });
    }
    deliveryAddress = json['deliveryAddress'] != null
        ? DeliveryAddress.fromJson(json['deliveryAddress'])
        : null;
    customerCurrencyCode = json['customerCurrencyCode'];
    currencyRate = json['currencyRate'];
    currencyId = json['currency_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deliveryUserAddressGuid'] = deliveryUserAddressGuid;
    data['ispickupOrder'] = ispickupOrder;
    data['serviceProiderGuid'] = serviceProiderGuid;
    data['customerGuid'] = customerGuid;
    if (orderDeliveryDateModel != null) {
      data['OrderDeliveryDateModel'] = orderDeliveryDateModel!.toJson();
    }
    if (orderDeliveryTimeModel != null) {
      data['OrderDeliveryTimeModel'] = orderDeliveryTimeModel!.toJson();
    }
    data['paymentMethodGuid'] = paymentMethodGuid;
    if (orderItems != null) {
      data['orderItems'] = orderItems!.map((v) => v.toJson()).toList();
    }
    if (deliveryAddress != null) {
      data['deliveryAddress'] = deliveryAddress!.toJson();
    }
    data['customerCurrencyCode'] = customerCurrencyCode;
    data['currencyRate'] = currencyRate;
    data['currency_Id'] = currencyId;
    return data;
  }
}

class OrderDeliveryDateModel {
  int? year;
  int? month;
  int? day;

  OrderDeliveryDateModel({this.year, this.month, this.day});

  OrderDeliveryDateModel.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['month'] = month;
    data['day'] = day;
    return data;
  }
}

class OrderDeliveryTimeModel {
  int? hour;
  int? minutes;

  OrderDeliveryTimeModel({this.hour, this.minutes});

  OrderDeliveryTimeModel.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    minutes = json['minutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hour'] = hour;
    data['minutes'] = minutes;
    return data;
  }
}

class OrderItems {
  String? productGuid;
  String? quantity;
  String? unitPrice;
  String? priceIncl;
  String? finalPrice;
  bool? isSpecialOfferItem;
  List<ProductAttrbutes>? productAttrbutes;

  OrderItems(
      {this.productGuid,
      this.quantity,
      this.unitPrice,
      this.priceIncl,
      this.finalPrice,
      this.isSpecialOfferItem,
      this.productAttrbutes});

  OrderItems.fromJson(Map<String, dynamic> json) {
    productGuid = json['productGuid'];
    quantity = json['quantity'];
    unitPrice = json['unitPrice'];
    priceIncl = json['priceIncl'];
    finalPrice = json['finalPrice'];
    isSpecialOfferItem = json['isSpecialOfferItem'];
    if (json['productAttrbutes'] != null) {
      productAttrbutes = <ProductAttrbutes>[];
      json['productAttrbutes'].forEach((v) {
        productAttrbutes!.add(ProductAttrbutes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productGuid'] = productGuid;
    data['quantity'] = quantity;
    data['unitPrice'] = unitPrice;
    data['priceIncl'] = priceIncl;
    data['finalPrice'] = finalPrice;
    data['isSpecialOfferItem'] = isSpecialOfferItem;
    if (productAttrbutes != null) {
      data['productAttrbutes'] =
          productAttrbutes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductAttrbutes {
  String? groupGuid;
  String? selectedOptionGuid;

  ProductAttrbutes({this.groupGuid, this.selectedOptionGuid});

  ProductAttrbutes.fromJson(Map<String, dynamic> json) {
    groupGuid = json['GroupGuid'];
    selectedOptionGuid = json['selectedOptionGuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['GroupGuid'] = groupGuid;
    data['selectedOptionGuid'] = selectedOptionGuid;
    return data;
  }
}

class DeliveryAddress {
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

  DeliveryAddress(
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

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
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
