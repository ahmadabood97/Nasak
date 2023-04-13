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
  int? currencyRate;
  String? currencyId;

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
      this.currencyId});
}

class OrderDeliveryDateModel {
  int? year;
  int? month;
  int? day;

  OrderDeliveryDateModel({this.year, this.month, this.day});
}

class OrderDeliveryTimeModel {
  int? hour;
  int? minutes;

  OrderDeliveryTimeModel({this.hour, this.minutes});
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
}

class ProductAttrbutes {
  String? groupGuid;
  String? selectedOptionGuid;

  ProductAttrbutes({this.groupGuid, this.selectedOptionGuid});
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
}
