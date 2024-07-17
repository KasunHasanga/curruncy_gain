
import 'package:currency_grain/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:get/get.dart';





class OnBoardingController extends GetxController {
  // SharedPref sharedPref = SharedPref();
  // final storage = const FlutterSecureStorage();
  // RxList<CountryCode> countryLanguage = <CountryCode>[].obs;
  // Rx<CountryCode> selectedLanguage =
  //     const CountryCode(name: 'Denmark', code: '0', dialCode: '').obs;
  // RxString selectedLanguageFlag = AllImages().imgDenmarkFlag.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  checkSessionStatus() async {
    await Future.delayed(const Duration(seconds: 3), () async {
      Get.off(() =>  DashboardPage());
    });
  }

  // checkSessionStatus() async {
  //   await Future.delayed(const Duration(seconds: 5), () async {
  //     if (await sharedPref.check(ShardPrefKey.appLocale)) {
  //       String currentLocale = await sharedPref.read(ShardPrefKey.appLocale);
  //       if (kDebugMode) {
  //         print(currentLocale);
  //       }
  //       var locale = Locale(currentLocale);
  //       if (currentLocale == "sv-SE") {
  //         selectedLanguage.value = countryLanguage[2];
  //       } else if (currentLocale == "nb-NO") {
  //         selectedLanguage.value = countryLanguage[1];
  //       } else if (currentLocale == "da-DK") {
  //         selectedLanguage.value = countryLanguage[0];
  //       }
  //       changeLanguage(locale);
  //     } else {
  //       var locale = const Locale('en');
  //
  //       //_helper.changeLanguage(locale);
  //     }
  //
  //     if (await sharedPref.check(ShardPrefKey.userLoggedIn)) {
  //       // refreshToken();
  //     } else {
  //       if (await storage.containsKey(key: ShardPrefKey.sessionToken)) {
  //         if (await sharedPref.check(ShardPrefKey.signUpCurrentView)) {
  //           // signupStatus(true);
  //         } else {
  //           Get.off(() =>  DashboardPage());
  //         }
  //       } else {
  //         Get.off(() =>  DashboardPage());
  //       }
  //     }
  //   });
  // }

  ///
  /// Set App Language
  // void changeLanguage(Locale selectedLocale) {
  //   sharedPref.save(ShardPrefKey.appLocale, selectedLocale.languageCode);
  //   Get.updateLocale(selectedLocale);
  //   if (selectedLocale.languageCode == "sv-SE") {
  //     selectedLanguage.value = countryLanguage[2];
  //     selectedLanguageFlag.value = AllImages().imgSwedenFlag;
  //   } else if (selectedLocale.languageCode == "nb-NO") {
  //     selectedLanguage.value = countryLanguage[1];
  //     selectedLanguageFlag.value = AllImages().imgNorwayFlag;
  //   } else if (selectedLocale.languageCode == "da-DK") {
  //     selectedLanguage.value = countryLanguage[0];
  //     selectedLanguageFlag.value = AllImages().imgDenmarkFlag;
  //   }
  // }
}
