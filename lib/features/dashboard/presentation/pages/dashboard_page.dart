import 'dart:convert';

import 'package:currency_grain/common_widget/drawer_widget.dart';
import 'package:currency_grain/config/colors.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../../common_widget/app_text_field.dart';
import '../../../../config/constants.dart';
import '../../../../config/fonts.dart';
import '../../../../core/network/client.dart';
import '../../../currency_selection/presentation/pages/currency_selection_page.dart';
import '../../model/contry_model.dart';
import '../../model/exchangeRateResponseModel.dart';
import '../controller/dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard';
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DashboardController dashboardController;
  final globalKey = GlobalKey<ScaffoldState>();
  Clinet client = Clinet();

  List<CurrencyConverterData> currencyConverters = [
    CurrencyConverterData(
      currency01: countryList[10],
      currency02: countryList[5],
      currencyConverterController01: TextEditingController(),
      currencyConverterController02: TextEditingController(),
    ),
    CurrencyConverterData(
      currency01: countryList[10],
      currency02: countryList[5],
      currencyConverterController01: TextEditingController(),
      currencyConverterController02: TextEditingController(),
    ),
  ];

  @override
  void dispose() {
    for (var converter in currencyConverters) {
      converter.currencyConverterController01.dispose();
      converter.currencyConverterController02.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    if (Get.isRegistered<DashboardController>()) {
      dashboardController = Get.find();
    } else {
      dashboardController = Get.put(DashboardController());
    }

    super.initState();
  }

  void getExchangeRates({
    required GlobalKey<ScaffoldState> scaffoldKey,
    required TextEditingController secondaryController,
    required double amount,
    required Country currency01,
    required Country currency02,
  }) async {
    try {
      String fromCurrency = currency01.currencyCode!;
      String toCurrency = currency02.currencyCode!;
      String baseUrl = "https://api.apilayer.com/exchangerates_data/convert";
      var response = await client.get(
          "$baseUrl?to=$toCurrency&from=$fromCurrency&amount=$amount",
          query: {"apikey": "I4Q3VVqJsLla3FcY9GsSZ1cm5K2e3Qlb"},
          scaffoldKey: scaffoldKey);
      var exchangeRateResponse =
          ExchangeRateResponseModel.fromJson(jsonDecode(response.toString()));
      setState(() {
        secondaryController.text =
            exchangeRateResponse.result?.toStringAsFixed(2) ?? "";
      });
      if (kDebugMode) {
        print(response);
      }
    } on DioException catch (ex) {
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw Exception(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Advanced Exchanger",
          style: AppFonts.styleWithGilroyMediumText(
              color: Theme.of(context).colorScheme.onBackground,
              fSize: FontSizeValue.fontSize16),
        ),
      ),
      drawer: DrawerWidget(
        dashboardController: dashboardController,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: currencyConverters.length,
                itemBuilder: (context, index) {
                  var converter = currencyConverters[index];
                  return Stack(
                    children: [
                      index > 0
                          ? Positioned(
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currencyConverters.removeAt(index);
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.close,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                ),
                              ))
                          : Container(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "INSERT AMOUNT :",
                            style: AppFonts.styleWithGilroyMediumText(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.5),
                                fSize: FontSizeValue.fontSize14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          currencyInputBlock(
                            countryCode: converter.currency01.currencyCode!,
                            isoCode: converter.currency01.isoCode!,
                            countryName: converter.currency01.iso3Code!,
                            primaryTextEditingController:
                                converter.currencyConverterController01,
                            isFirstBlock: true,
                            secondaryTextEditingController:
                                converter.currencyConverterController02,
                            currency01: converter.currency01,
                            currency02: converter.currency02,
                            index: index,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "CONVERT TO :",
                            style: AppFonts.styleWithGilroyMediumText(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.5),
                                fSize: FontSizeValue.fontSize14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          currencyInputBlock(
                            countryCode: converter.currency02.currencyCode!,
                            countryName: converter.currency02.iso3Code!,
                            isoCode: converter.currency02.isoCode!,
                            primaryTextEditingController:
                                converter.currencyConverterController02,
                            secondaryTextEditingController:
                                converter.currencyConverterController01,
                            currency01: converter.currency01,
                            currency02: converter.currency02,
                            index: index,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.kLightGreen.withOpacity(0.2))),
                onPressed: () {
                  setState(() {
                    currencyConverters.add(CurrencyConverterData(
                      currency01: countryList[10],
                      currency02: countryList[5],
                      currencyConverterController01: TextEditingController(),
                      currencyConverterController02: TextEditingController(),
                    ));
                  });
                },
                icon: const Icon(Icons.add, color: AppColors.kLightGreen),
                label: Text(
                  "ADD CONVERTER",
                  style: AppFonts.styleWithGilroyMediumText(
                      color: AppColors.kLightGreen,
                      fSize: FontSizeValue.fontSize16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget currencyInputBlock({
    required String countryName,
    required String isoCode,
    required countryCode,
    bool isFirstBlock = false,
    required TextEditingController primaryTextEditingController,
    required TextEditingController secondaryTextEditingController,
    required Country currency01,
    required Country currency02,
    required int index,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.fromLTRB(13, 17, 13, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            suffixIcon: GestureDetector(
              onTap: () async {
                var result =
                    await Get.toNamed(CurrencySelectionPage.routeName) ?? "";
                if (result != "") {
                  setState(() {
                    if (isFirstBlock) {
                      currencyConverters[index].currency01 = result;
                    } else {
                      currencyConverters[index].currency02 = result;
                    }
                  });
                }
              },
              child: Container(
                width: 130,
                height: 50,
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.asset(
                        "assets/contries/${isoCode.toLowerCase()}.png",
                        width: 35,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      countryCode,
                      style: AppFonts.styleWithGilroyMediumText(
                          color: Theme.of(context).colorScheme.onBackground,
                          fSize: FontSizeValue.fontSize16,
                          fontWeight: FontWeight.w400),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).colorScheme.onBackground,
                    )
                  ],
                ),
              ),
            ),
            textController: primaryTextEditingController,
            labelText: ''.tr,
            labelColor: Theme.of(context).colorScheme.onBackground,
            textColor: Theme.of(context).colorScheme.onBackground,
            inputFormatter: FilteringTextInputFormatter.digitsOnly,
            keyBoardType: TextInputType.number,
            onChanged: (str) {
              getExchangeRates(
                scaffoldKey: globalKey,
                amount: double.parse(primaryTextEditingController.text),
                secondaryController: secondaryTextEditingController,
                currency01: currency01,
                currency02: currency02,
              );
            },
            onFieldSubmitted: (str) {
              getExchangeRates(
                scaffoldKey: globalKey,
                amount: double.parse(primaryTextEditingController.text),
                secondaryController: secondaryTextEditingController,
                currency01: currency01,
                currency02: currency02,
              );
            },
          ),
        ],
      ),
    );
  }
}

class CurrencyConverterData {
  Country currency01;
  Country currency02;
  TextEditingController currencyConverterController01;
  TextEditingController currencyConverterController02;

  CurrencyConverterData({
    required this.currency01,
    required this.currency02,
    required this.currencyConverterController01,
    required this.currencyConverterController02,
  });
}
