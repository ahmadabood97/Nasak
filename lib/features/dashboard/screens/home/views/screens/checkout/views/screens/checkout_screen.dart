import 'package:flutter/material.dart';
import 'package:nasak/core/utils/constants.dart';
import 'package:nasak/features/dashboard/screens/home/controllers/provider/home_provider.dart';
import 'package:nasak/features/dashboard/screens/home/models/app_services_model.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/checkout/controllers/provider/checkout_provider.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/checkout/models/checkout_model.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../../../../../../../config/routes/app_routes.dart';
import '../../../../../../../../../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../../../../../../../../../core/utils/hex_colors.dart';
import '../../../../../../../../../core/widgets/dropdown.dart';
import '../../../../../../../../../core/widgets/show_dialog.dart';
import '../../../../../../../../../core/widgets/text_field_custom.dart';
import '../../../../../../../../auth/screens/login/controllers/provider/login_provider.dart';
import '../../../../../../../../auth/screens/login/models/login_response_model.dart';
import '../../../../../../../../auth/screens/register/controllers/provider/register_provider.dart';
import '../../../../../../addresses/controllers/provider/address_provider.dart';
import '../../../../../../addresses/views/screens/add_address/widgets/add_location.dart';
import '../../../../../../countries/controllers/provider/countries_provider.dart';
import '../../../dashboard_shops/screens/shops/screens/shop_details/views/widgets/bag_icon.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../widgets/agree_terms.dart';
import '../widgets/custom_button.dart';
import '../widgets/do_have_account.dart';
import '../widgets/personal_details.dart';
import '../widgets/select_data.dart';
import 'delivery_date_time/controllers/provider/delivery_date_time_provider.dart';

class CheckoutScreen extends StatefulWidget {
  final ServiceProviders serviceProviders;

  const CheckoutScreen({super.key, required this.serviceProviders});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final GlobalKey<FormState> checkoutFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    Provider.of<DeliveryDateTimeProvider>(context, listen: false)
        .setDeliveryTimeList(
            startHour: Constants.startHour,
            lastHour: Constants.endHour,
            interval: 30,
            perparingTime: 30,
            offest: 180);
    Provider.of<RegisterProvider>(context, listen: false).countryDropdownList =
        [];
    Provider.of<RegisterProvider>(context, listen: false).citiesDropdownList =
        [];
    Provider.of<RegisterProvider>(context, listen: false).reigonDropdownList =
        [];
    Provider.of<RegisterProvider>(context, listen: false).countrySelectedValue =
        '';
    Provider.of<RegisterProvider>(context, listen: false).citySelectedValue =
        '';
    Provider.of<RegisterProvider>(context, listen: false).reigonSelectedValue =
        '';

    Provider.of<RegisterProvider>(context, listen: false).countryId = '';
    Provider.of<RegisterProvider>(context, listen: false).cityId = '';
    Provider.of<RegisterProvider>(context, listen: false).reigonId = '';

    for (var element in Provider.of<CountriesProvider>(context, listen: false)
        .countries!
        .result!
        .countries!) {
      Provider.of<RegisterProvider>(context, listen: false)
          .countryDropdownList
          .add(element.name!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Provider.of<LoginProvider>(context, listen: false).loginData != null
              ? Colors.white
              : const Color.fromARGB(255, 255, 245, 240),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: const Text(
          'Complete your order',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: bagIcon(
                const Color.fromARGB(255, 3, 59, 107),
                Provider.of<HomeProvider>(context, listen: true)
                    .itemInCart
                    .toString()),
          ),
        ],
      ),
      body: Form(
        key: checkoutFormKey,
        child: Stack(
          children: [
            ListView(
              children: [
                Provider.of<LoginProvider>(context, listen: true).loginData !=
                        null
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Select Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 3, 59, 107)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                LoginResponseModel userData =
                                    Provider.of<LoginProvider>(context,
                                            listen: false)
                                        .loginData!;
                                Provider.of<AddressProvider>(context,
                                        listen: false)
                                    .getAddress(
                                  context: context,
                                  token: userData.authToken,
                                  stopLoading: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                        context, Routes.selectAddressRoute);
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(3)),
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5))),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  Provider.of<CheckoutProvider>(
                                                                  context,
                                                                  listen: true)
                                                              .address !=
                                                          null
                                                      ? Provider.of<
                                                                  CheckoutProvider>(
                                                              context,
                                                              listen: true)
                                                          .address!
                                                          .addressName!
                                                      : "select address",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: const [
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 15,
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 15),
                            child: doHaveAccount(context),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 15),
                            child: Column(
                              children: [
                                dropDown(
                                    'Select your country',
                                    Provider.of<RegisterProvider>(context,
                                            listen: true)
                                        .countrySelectedValue,
                                    Provider.of<RegisterProvider>(context,
                                            listen: true)
                                        .countryDropdownList,
                                    'Country',
                                    context,
                                    "SignUpScreen"),
                                const SizedBox(
                                  height: 15,
                                ),
                                dropDown(
                                    'Select your city',
                                    Provider.of<RegisterProvider>(context,
                                            listen: true)
                                        .citySelectedValue,
                                    Provider.of<RegisterProvider>(context,
                                            listen: true)
                                        .citiesDropdownList,
                                    'City',
                                    context,
                                    "SignUpScreen"),
                                const SizedBox(
                                  height: 15,
                                ),
                                dropDown(
                                    'Select your reigon',
                                    Provider.of<RegisterProvider>(context,
                                            listen: true)
                                        .reigonSelectedValue,
                                    Provider.of<RegisterProvider>(context,
                                            listen: true)
                                        .reigonDropdownList,
                                    'Reigon',
                                    context,
                                    "SignUpScreen"),
                                const SizedBox(
                                  height: 15,
                                ),
                                const TextFieldCustom(
                                    title: "Address Name",
                                    type: "address_name_checkout"),
                                const SizedBox(
                                  height: 15,
                                ),
                                const TextFieldCustom(
                                    title: "Address Extra Description",
                                    type: "address_extra_desc_checkout"),
                                const SizedBox(
                                  height: 15,
                                ),
                                const TextFieldCustom(
                                    title: "Build Name",
                                    type: "address_build_name_checkout"),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: const [
                                    Expanded(
                                        flex: 8,
                                        child: TextFieldCustom(
                                            title: "Floor Number",
                                            type:
                                                "address_floor_num_checkout")),
                                    Expanded(flex: 1, child: SizedBox()),
                                    Expanded(
                                        flex: 8,
                                        child: TextFieldCustom(
                                            title: "Entrance Num",
                                            type:
                                                "address_entrance_num_checkout")),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                personalDetails(),
                                const SizedBox(
                                  height: 15,
                                ),
                                const TextFieldCustom(
                                  title: "Add note for delivery (optional)",
                                  type: 'note',
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                const AddLocation(),
                              ],
                            ),
                          )
                        ],
                      ),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<DeliveryDateTimeProvider>(context,
                                    listen: false)
                                .setDeliveryDateList(7);
                            Navigator.pushNamed(
                                context, Routes.deleveryDateRoute);
                          },
                          child: selectData(
                              icon: Icons.date_range,
                              subtitle: Provider.of<DeliveryDateTimeProvider>(
                                      context,
                                      listen: true)
                                  .daySelectedString,
                              title: 'Delivery date',
                              image: ''),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<DeliveryDateTimeProvider>(context,
                                    listen: false)
                                .setDeliveryTimeList(
                                    startHour: Constants.startHour,
                                    lastHour: Constants.endHour,
                                    interval: 30,
                                    perparingTime: 30,
                                    offest: 180);
                            Navigator.pushNamed(
                                context, Routes.deleveryTimeRoute);
                          },
                          child: selectData(
                              icon: Icons.timer,
                              subtitle:
                                  "${DateFormat('HH').format(Provider.of<DeliveryDateTimeProvider>(context, listen: true).timeSelected!)}:${DateFormat('mm').format(Provider.of<DeliveryDateTimeProvider>(context, listen: true).timeSelected!)} ",
                              title: 'Delivery time',
                              image: ''),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: selectData(
                            subtitle: 'Google Pay',
                            title: 'Pay with',
                            image: ImageAssets.googlePayIcon),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, Routes.addVoucherRoute),
                          child: const Text(
                            'Add voucher code',
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 59, 107),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: agreeTerms(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 15, right: 15, bottom: 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total amount',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${Provider.of<HomeProvider>(context, listen: true).subTotal.toString()} ${Provider.of<HomeProvider>(context, listen: false).currency!.symbol!}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  if (Provider.of<LoginProvider>(context, listen: false)
                          .loginData !=
                      null) {
                    if (Provider.of<CheckoutProvider>(context, listen: false)
                            .address !=
                        null) {
                      Provider.of<CheckoutProvider>(context, listen: false)
                          .checkout(
                              CheckoutModel(
                                customerGuid: Provider.of<LoginProvider>(
                                        context,
                                        listen: false)
                                    .loginData!
                                    .id!,
                                deliveryUserAddressGuid:
                                    Provider.of<CheckoutProvider>(context,
                                            listen: false)
                                        .address!
                                        .id
                                        .toString(),
                                orderDeliveryDateModel: OrderDeliveryDateModel(
                                    day: Provider.of<DeliveryDateTimeProvider>(
                                            context,
                                            listen: false)
                                        .daySelected!
                                        .day,
                                    month:
                                        Provider.of<DeliveryDateTimeProvider>(
                                                context,
                                                listen: false)
                                            .daySelected!
                                            .month,
                                    year: Provider.of<DeliveryDateTimeProvider>(
                                            context,
                                            listen: false)
                                        .daySelected!
                                        .year),
                                orderDeliveryTimeModel: OrderDeliveryTimeModel(
                                    hour: Provider.of<DeliveryDateTimeProvider>(
                                            context,
                                            listen: false)
                                        .timeSelected!
                                        .hour,
                                    minutes:
                                        Provider.of<DeliveryDateTimeProvider>(
                                                context,
                                                listen: false)
                                            .timeSelected!
                                            .minute),
                                currencyId: Provider.of<HomeProvider>(context,
                                        listen: false)
                                    .currency!
                                    .id!,
                                currencyRate: double.parse(
                                    Provider.of<HomeProvider>(context,
                                            listen: false)
                                        .currency!
                                        .rate!),
                                customerCurrencyCode: Provider.of<HomeProvider>(
                                        context,
                                        listen: false)
                                    .currency!
                                    .symbol!,
                                ispickupOrder: Provider.of<HomeProvider>(
                                        context,
                                        listen: false)
                                    .isPickup,
                                serviceProiderGuid: widget.serviceProviders.id,
                                orderItems: Provider.of<HomeProvider>(context,
                                        listen: false)
                                    .orderItemsList,
                                paymentMethodGuid:
                                    'A707B7CE-8A65-41B2-A8D1-8B5C8AE78F8E',
                              ),
                              context: context, stopLoading: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        showCustomDialog(context, 'Your order is success...');
                      },
                              token: Provider.of<LoginProvider>(context,
                                              listen: false)
                                          .loginData !=
                                      null
                                  ? Provider.of<LoginProvider>(context,
                                          listen: false)
                                      .loginData!
                                      .authToken
                                  : '');
                    } else {
                      showCustomDialog(
                          context, 'Please select your address...');
                    }
                  } else {
                    if (checkoutFormKey.currentState!.validate()) {
                      if (Provider.of<AddressProvider>(context, listen: false)
                                  .lat !=
                              null &&
                          Provider.of<AddressProvider>(context, listen: false)
                                  .long !=
                              null) {
                        Provider.of<RegisterProvider>(context, listen: false)
                            .setCountryCityReigonId();
                        Provider.of<CheckoutProvider>(context, listen: false)
                            .checkout(
                                CheckoutModel(
                                  deliveryAddress: DeliveryAddress(
                                    addressName: Provider.of<CheckoutProvider>(
                                            context,
                                            listen: false)
                                        .addressNameCheckoutController
                                        .text,
                                    addressExtraDesc:
                                        Provider.of<CheckoutProvider>(context,
                                                listen: false)
                                            .emailCheckoutController
                                            .text,
                                    buildName: Provider.of<CheckoutProvider>(
                                            context,
                                            listen: false)
                                        .buildNameCheckoutController
                                        .text,
                                    cityGuid: Provider.of<RegisterProvider>(
                                            context,
                                            listen: false)
                                        .cityId,
                                    countryGuid: Provider.of<RegisterProvider>(
                                            context,
                                            listen: false)
                                        .countryId,
                                    entranceNum: Provider.of<CheckoutProvider>(
                                            context,
                                            listen: false)
                                        .entranceNumCheckoutController
                                        .text,
                                    firstname: Provider.of<CheckoutProvider>(
                                            context,
                                            listen: false)
                                        .firstNameCheckoutController
                                        .text,
                                    floorNum: Provider.of<CheckoutProvider>(
                                            context,
                                            listen: false)
                                        .floorNumCheckoutController
                                        .text,
                                    lastname: Provider.of<CheckoutProvider>(
                                            context,
                                            listen: false)
                                        .lastNameCheckoutController
                                        .text,
                                    locLat: Provider.of<AddressProvider>(
                                            context,
                                            listen: false)
                                        .lat
                                        .toString(),
                                    locLong: Provider.of<AddressProvider>(
                                            context,
                                            listen: false)
                                        .long
                                        .toString(),
                                    phonenumber: Provider.of<CheckoutProvider>(
                                            context,
                                            listen: false)
                                        .phoneCheckoutController
                                        .text,
                                    regionGuid: Provider.of<RegisterProvider>(
                                            context,
                                            listen: false)
                                        .reigonId,
                                  ),
                                  orderDeliveryDateModel:
                                      OrderDeliveryDateModel(
                                          day: Provider.of<
                                                      DeliveryDateTimeProvider>(
                                                  context,
                                                  listen: false)
                                              .daySelected!
                                              .day,
                                          month: Provider.of<
                                                      DeliveryDateTimeProvider>(
                                                  context,
                                                  listen: false)
                                              .daySelected!
                                              .month,
                                          year: Provider.of<
                                                      DeliveryDateTimeProvider>(
                                                  context,
                                                  listen: false)
                                              .daySelected!
                                              .year),
                                  orderDeliveryTimeModel:
                                      OrderDeliveryTimeModel(
                                          hour: Provider.of<
                                                      DeliveryDateTimeProvider>(
                                                  context,
                                                  listen: false)
                                              .timeSelected!
                                              .hour,
                                          minutes: Provider.of<
                                                      DeliveryDateTimeProvider>(
                                                  context,
                                                  listen: false)
                                              .timeSelected!
                                              .minute),
                                  currencyId: Provider.of<HomeProvider>(context,
                                          listen: false)
                                      .currency!
                                      .id!,
                                  currencyRate: double.parse(
                                      Provider.of<HomeProvider>(context,
                                              listen: false)
                                          .currency!
                                          .rate!),
                                  customerCurrencyCode:
                                      Provider.of<HomeProvider>(context,
                                              listen: false)
                                          .currency!
                                          .symbol!,
                                  ispickupOrder: Provider.of<HomeProvider>(
                                          context,
                                          listen: false)
                                      .isPickup,
                                  serviceProiderGuid:
                                      widget.serviceProviders.id,
                                  orderItems: Provider.of<HomeProvider>(context,
                                          listen: false)
                                      .orderItemsList,
                                  paymentMethodGuid:
                                      'A707B7CE-8A65-41B2-A8D1-8B5C8AE78F8E',
                                ),
                                context: context, stopLoading: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          showCustomDialog(context, 'Your order is success...');
                        },
                                token: Provider.of<LoginProvider>(context,
                                                listen: false)
                                            .loginData !=
                                        null
                                    ? Provider.of<LoginProvider>(context,
                                            listen: false)
                                        .loginData!
                                        .authToken
                                    : '');
                      } else {
                        showCustomDialog(
                            context, 'Please select your location...');
                      }
                    }
                  }
                },
                child: customButton(
                    HexColor('3359ba'), 'Order and pay', Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
