class OrderDetailsResponseModel {
  String? appVersion;
  String? apiVersion;
  int? statusCode;
  String? errorMessage;
  Result? result;

  OrderDetailsResponseModel(
      {this.appVersion,
      this.apiVersion,
      this.statusCode,
      this.errorMessage,
      this.result});

  OrderDetailsResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? serviceProviderName;
  String? serviceProiderGuid;
  String? currencyId;
  String? currencySymbol;
  bool? isConfirmed;
  bool? ispickupOrder;
  String? customOrderNumber;
  String? customOrderDateofReceiptNumber;
  String? customOrderFinalDeliveryNumber;
  dynamic billingAddressGuid;
  String? pickupAddressGuid;
  String? shippingAddressGuid;
  String? customerGuid;
  bool? pickupInStore;
  int? orderStatusId;
  String? orderStatusName;
  int? shippingStatusId;
  int? paymentStatusId;
  String? paymentStatusName;
  String? paymentMethodSystemName;
  String? customerCurrencyCode;
  double? currencyRate;
  dynamic orderSubTotalDiscount;
  dynamic orderShippingFees;
  dynamic paymentMethodAdditionalFees;
  String? orderTotal;
  dynamic paidDateUtc;
  int? shippingMethod;
  bool? deleted;
  String? createdOnUtc;
  String? orderDeliveryDate;
  String? orderDeliveryTime;
  String? paymentMethodGuid;
  String? paymentMethodName;
  List<OrderItems>? orderItems;

  Result(
      {this.id,
      this.serviceProviderName,
      this.serviceProiderGuid,
      this.currencyId,
      this.currencySymbol,
      this.isConfirmed,
      this.ispickupOrder,
      this.customOrderNumber,
      this.customOrderDateofReceiptNumber,
      this.customOrderFinalDeliveryNumber,
      this.billingAddressGuid,
      this.pickupAddressGuid,
      this.shippingAddressGuid,
      this.customerGuid,
      this.pickupInStore,
      this.orderStatusId,
      this.orderStatusName,
      this.shippingStatusId,
      this.paymentStatusId,
      this.paymentStatusName,
      this.paymentMethodSystemName,
      this.customerCurrencyCode,
      this.currencyRate,
      this.orderSubTotalDiscount,
      this.orderShippingFees,
      this.paymentMethodAdditionalFees,
      this.orderTotal,
      this.paidDateUtc,
      this.shippingMethod,
      this.deleted,
      this.createdOnUtc,
      this.orderDeliveryDate,
      this.orderDeliveryTime,
      this.paymentMethodGuid,
      this.paymentMethodName,
      this.orderItems});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceProviderName = json['serviceProviderName'];
    serviceProiderGuid = json['serviceProiderGuid'];
    currencyId = json['currency_Id'];
    currencySymbol = json['currencySymbol'];
    isConfirmed = json['isConfirmed'];
    ispickupOrder = json['ispickupOrder'];
    customOrderNumber = json['customOrderNumber'];
    customOrderDateofReceiptNumber = json['customOrderDateofReceiptNumber'];
    customOrderFinalDeliveryNumber = json['customOrderFinalDeliveryNumber'];
    billingAddressGuid = json['billingAddressGuid'];
    pickupAddressGuid = json['pickupAddressGuid'];
    shippingAddressGuid = json['shippingAddressGuid'];
    customerGuid = json['customerGuid'];
    pickupInStore = json['pickupInStore'];
    orderStatusId = json['orderStatusId'];
    orderStatusName = json['orderStatusName'];
    shippingStatusId = json['shippingStatusId'];
    paymentStatusId = json['paymentStatusId'];
    paymentStatusName = json['paymentStatusName'];
    paymentMethodSystemName = json['paymentMethodSystemName'];
    customerCurrencyCode = json['customerCurrencyCode'];
    currencyRate = json['currencyRate'].toDouble();
    orderSubTotalDiscount = json['orderSubTotalDiscount'];
    orderShippingFees = json['orderShippingFees'];
    paymentMethodAdditionalFees = json['paymentMethodAdditionalFees'];
    orderTotal = json['orderTotal'];
    paidDateUtc = json['paidDateUtc'];
    shippingMethod = json['shippingMethod'];
    deleted = json['deleted'];
    createdOnUtc = json['createdOnUtc'];
    orderDeliveryDate = json['orderDeliveryDate'];
    orderDeliveryTime = json['orderDeliveryTime'];
    paymentMethodGuid = json['paymentMethodGuid'];
    paymentMethodName = json['paymentMethodName'];
    if (json['orderItems'] != null) {
      orderItems = <OrderItems>[];
      json['orderItems'].forEach((v) {
        orderItems!.add(OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['serviceProviderName'] = serviceProviderName;
    data['serviceProiderGuid'] = serviceProiderGuid;
    data['currency_Id'] = currencyId;
    data['currencySymbol'] = currencySymbol;
    data['isConfirmed'] = isConfirmed;
    data['ispickupOrder'] = ispickupOrder;
    data['customOrderNumber'] = customOrderNumber;
    data['customOrderDateofReceiptNumber'] = customOrderDateofReceiptNumber;
    data['customOrderFinalDeliveryNumber'] = customOrderFinalDeliveryNumber;
    data['billingAddressGuid'] = billingAddressGuid;
    data['pickupAddressGuid'] = pickupAddressGuid;
    data['shippingAddressGuid'] = shippingAddressGuid;
    data['customerGuid'] = customerGuid;
    data['pickupInStore'] = pickupInStore;
    data['orderStatusId'] = orderStatusId;
    data['orderStatusName'] = orderStatusName;
    data['shippingStatusId'] = shippingStatusId;
    data['paymentStatusId'] = paymentStatusId;
    data['paymentStatusName'] = paymentStatusName;
    data['paymentMethodSystemName'] = paymentMethodSystemName;
    data['customerCurrencyCode'] = customerCurrencyCode;
    data['currencyRate'] = currencyRate;
    data['orderSubTotalDiscount'] = orderSubTotalDiscount;
    data['orderShippingFees'] = orderShippingFees;
    data['paymentMethodAdditionalFees'] = paymentMethodAdditionalFees;
    data['orderTotal'] = orderTotal;
    data['paidDateUtc'] = paidDateUtc;
    data['shippingMethod'] = shippingMethod;
    data['deleted'] = deleted;
    data['createdOnUtc'] = createdOnUtc;
    data['orderDeliveryDate'] = orderDeliveryDate;
    data['orderDeliveryTime'] = orderDeliveryTime;
    data['paymentMethodGuid'] = paymentMethodGuid;
    data['paymentMethodName'] = paymentMethodName;
    if (orderItems != null) {
      data['orderItems'] = orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  String? orderGuid;
  String? serviceProviderName;
  String? productGuid;
  String? quantity;
  String? unitPrice;
  String? priceIncl;
  String? finalPrice;
  String? attrbutesJson;
  String? attrbutesDescStr;
  String? orderItemNotes;
  bool? isSpecialOfferItem;
  dynamic specialOfferId;
  // List<dynamic>? productAttrbutes;

  OrderItems({
    this.orderGuid,
    this.serviceProviderName,
    this.productGuid,
    this.quantity,
    this.unitPrice,
    this.priceIncl,
    this.finalPrice,
    this.attrbutesJson,
    this.attrbutesDescStr,
    this.orderItemNotes,
    this.isSpecialOfferItem,
    this.specialOfferId,
    // this.productAttrbutes
  });

  OrderItems.fromJson(Map<String, dynamic> json) {
    orderGuid = json['orderGuid'];
    serviceProviderName = json['serviceProviderName'];
    productGuid = json['productGuid'];
    quantity = json['quantity'];
    unitPrice = json['unitPrice'];
    priceIncl = json['priceIncl'];
    finalPrice = json['finalPrice'];
    attrbutesJson = json['attrbutesJson'];
    attrbutesDescStr = json['attrbutesDescStr'];
    orderItemNotes = json['orderItemNotes'];
    isSpecialOfferItem = json['isSpecialOfferItem'];
    specialOfferId = json['specialOffer_Id'];
    // if (json['productAttrbutes'] != null) {
    //   productAttrbutes = <Null>[];
    //   json['productAttrbutes'].forEach((v) {
    //     productAttrbutes!.add(Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderGuid'] = orderGuid;
    data['serviceProviderName'] = serviceProviderName;
    data['productGuid'] = productGuid;
    data['quantity'] = quantity;
    data['unitPrice'] = unitPrice;
    data['priceIncl'] = priceIncl;
    data['finalPrice'] = finalPrice;
    data['attrbutesJson'] = attrbutesJson;
    data['attrbutesDescStr'] = attrbutesDescStr;
    data['orderItemNotes'] = orderItemNotes;
    data['isSpecialOfferItem'] = isSpecialOfferItem;
    data['specialOffer_Id'] = specialOfferId;
    // if (productAttrbutes != null) {
    //   data['productAttrbutes'] =
    //       productAttrbutes!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
