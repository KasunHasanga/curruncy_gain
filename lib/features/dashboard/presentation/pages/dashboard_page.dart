import 'dart:convert';

import 'package:currency_grain/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../../common_widget/app_text_field.dart';
import '../../../../config/bank_images.dart';
import '../../../../config/constants.dart';
import '../../../../config/fonts.dart';
import '../../../../config/theme/theme_service.dart';
import '../../../../core/network/client.dart';
import '../../../currency_selection/presentation/pages/currency_selection_page.dart';
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

  Map<String, String> currency01 = {
    "countryCode": "USD",
    "countryName": "United States Dollar"
  };
  Map<String, String> currency02 = {
    "countryCode": "LKR",
    "countryName": "Sri Lankan Rupee"
  };

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

  // Map<String, String> headers = <String, String>{
  //   "apikey": "I4Q3VVqJsLla3FcY9GsSZ1cm5K2e3Qlb"
  //   // 'Content-Type': 'application/json',
  //   // 'Accept': 'application/json',
  //   // 'Authorization': 'Bearer $token'
  // };
  void getExchangeRates(
      {required GlobalKey<ScaffoldState> scaffoldKey,
      required TextEditingController secondaryController,
      required double amount}) async {
    print('q111111111');
    // Future<Map<String, dynamic>>
    try {
      String fromCurrency = currency01["countryCode"]!;
      String toCurrency = currency02["countryCode"]!;
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
        flexibleSpace: Container(
          decoration:  BoxDecoration(
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

      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                   gradient: AppColors.appbarGradient),
              child: Text(
                'kasun Hasanga',
                style: AppFonts.styleWithGilroyMediumText(
                    color: Theme.of(context).colorScheme.onBackground,
                    fSize: FontSizeValue.fontSize28),
              ),
            ),
            ListTile(
              title: Text(
                'Portfolio',
                style: AppFonts.styleWithGilroyMediumText(
                    color: Theme.of(context).colorScheme.onBackground,
                    fSize: FontSizeValue.fontSize16),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Obx(
              () => ListTile(
                title: Text(
                  'Dark Theme',
                  style: AppFonts.styleWithGilroyMediumText(
                      color: Theme.of(context).colorScheme.onBackground,
                      fSize: FontSizeValue.fontSize16),
                ),
                trailing: CupertinoSwitch(
                  onChanged: (value) {
                    dashboardController.isLightModeSelected.value = !value;
                    ThemeService().switchTheme(value);
                    dashboardController.isAuto.value = false;
                  },
                  value: !dashboardController.isLightModeSelected.value,
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            currencyInputBlock(
                countryCode: currency01["countryCode"]!,
                countryName: currency01["countryName"]!,
                primaryTextEditingController: currencyConverterController01,
                isFirstBlock: true,
                secondaryTextEditingController: currencyConverterController02),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: Image(
                    image: AssetImage(AllImages().currencyExchangeImg),
                  ),
                ),
              ),
            ),
            currencyInputBlock(
                countryCode: currency02["countryCode"]!,
                countryName: currency02["countryName"]!,
                primaryTextEditingController: currencyConverterController02,
                secondaryTextEditingController: currencyConverterController01),
            const SizedBox(
              height: 32,
            ),
            Text(
              "Indicative Exchange Rate",
              style:  AppFonts.styleWithGilroyMediumText(
                  color: Theme.of(context).colorScheme.onBackground,
                  fSize: FontSizeValue.fontSize16),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "1 ${currency01["countryCode"]!} = ${exchangeRateResponse.info!.rate?.toStringAsFixed(2) ?? ""} ${currency02["countryCode"]!}",
              style:  AppFonts.styleWithGilroyMediumText(
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                  fSize: FontSizeValue.fontSize16),
            ),
          ],
        ),
      ),
    );
  }

  Widget currencyInputBlock({
    required String countryName,
    required countryCode,
    bool isFirstBlock = false,
    required TextEditingController primaryTextEditingController,
    required TextEditingController secondaryTextEditingController,
  }) {
    return Container(
      decoration:  BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.fromLTRB(13, 17, 13, 18),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              var result =
                  await Get.toNamed(CurrencySelectionPage.routeName) ?? "";
              print(result);
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  countryName,
                  style: AppFonts.styleWithGilroyMediumText(
                      color:Theme.of(context).colorScheme.onBackground,
                      fSize: FontSizeValue.fontSize16,
                      fontWeight: FontWeight.w400),
                ),
                 Icon(
                  Icons.arrow_right_sharp,
                  color: Theme.of(context).colorScheme.onBackground,
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          AppTextField(
            textController: primaryTextEditingController,
            labelText: ''.tr,
            labelColor:  Theme.of(context).colorScheme.onBackground,
            textColor:  Theme.of(context).colorScheme.onBackground,
            inputFormatter: FilteringTextInputFormatter.digitsOnly,
            keyBoardType: TextInputType.number,

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
