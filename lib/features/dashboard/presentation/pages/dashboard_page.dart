import 'dart:convert';

import 'package:currency_grain/common_widget/drawer_widget.dart';

import 'package:flutter/cupertino.dart';
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
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DashboardController dashboardController;
  final globalKey = GlobalKey<ScaffoldState>();
  Clinet client = Clinet();

  TextEditingController currencyConverterController01 = TextEditingController();
  TextEditingController currencyConverterController02 = TextEditingController();

  ExchangeRateResponseModel exchangeRateResponse =
      ExchangeRateResponseModel(info: Info(rate: 0.0));


  Country currency01 = countryList[10];
  Country currency02 = countryList[5];


  @override
  void dispose() {
    currencyConverterController01.dispose();
    currencyConverterController02.dispose();
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


  void getExchangeRates(
      {required GlobalKey<ScaffoldState> scaffoldKey,
      required TextEditingController secondaryController,
      required double amount}) async {
    print('q111111111');
    // Future<Map<String, dynamic>>
    try {
      String fromCurrency = currency01.currencyCode!;
      String toCurrency = currency02.currencyCode!;
      // double amount = 100;
      String baseUrl = "https://api.apilayer.com/exchangerates_data/convert";
      var response = await client.get(
          "$baseUrl?to=$toCurrency&from=$fromCurrency&amount=$amount",
          // I4Q3VVqJsLla3FcY9GsSZ1cm5K2e3Qlb
          query: {"apikey": "I4Q3VVqJsLla3FcY9GsSZ1cm5K2e3Qlb"},
          scaffoldKey: scaffoldKey);
      exchangeRateResponse =
          ExchangeRateResponseModel.fromJson(jsonDecode(response.toString()));
      setState(() {
        secondaryController.text =
            exchangeRateResponse.result?.toStringAsFixed(2) ?? "";
      });
      print(response);
    } on DioException catch (ex) {
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw Exception(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => getExchangeRates(scaffoldKey: globalKey),
      // ),
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

      drawer: DrawerWidget(dashboardController: dashboardController,),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            currencyInputBlock(
                countryCode: currency01.iso3Code!,
                isoCode: currency01.isoCode!,
                countryName: currency01.iso3Code!,
                primaryTextEditingController: currencyConverterController01,
                isFirstBlock: true,
                secondaryTextEditingController: currencyConverterController02),
            const SizedBox(
              height: 20,
            ),
            currencyInputBlock(
                countryCode: currency02.iso3Code!,
                countryName: currency02.iso3Code!,
                isoCode: currency02.isoCode!,
                primaryTextEditingController: currencyConverterController02,
                secondaryTextEditingController: currencyConverterController01),

            const SizedBox(
              height: 32,
            ),

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
  }) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.fromLTRB(13, 17, 13, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isFirstBlock ? "INSERT AMOUNT :" : "CONVERT TO :",
            style: AppFonts.styleWithGilroyMediumText(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                fSize: FontSizeValue.fontSize14,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          AppTextField(
            suffixIcon: GestureDetector(
              // behavior: HitTestBehavior.opaque,
              onTap: () async {
                var result =
                    await Get.toNamed(CurrencySelectionPage.routeName) ?? "";
                if (result != "") {
                  if (isFirstBlock) {
                    setState(() {
                      currency01 = result;
                    });
                  } else {
                    setState(() {
                      currency02 = result;
                    });
                  }
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
                        // height: 25,
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
            // isEnabled: isFirstBlock,
            onFieldSubmitted: (str) {
              getExchangeRates(
                  scaffoldKey: globalKey,
                  amount: double.parse(primaryTextEditingController.text),
                  secondaryController: secondaryTextEditingController);
            },
            // onChanged: (str){
            //   getExchangeRates(scaffoldKey: globalKey,secondaryController: secondaryTextEditingController);
            //   // setState(() {
            //   //   secondaryTextEditingController.text=str;
            //   // });
            // },
          ),
        ],
      ),
    );
  }
}
