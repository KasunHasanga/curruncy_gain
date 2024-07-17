

import 'package:currency_grain/features/dashboard/dashboard_binding.dart';

import 'package:get/get.dart';


import '../features/currency_selection/currency_selection_binding.dart';
import '../features/currency_selection/presentation/pages/currency_selection_page.dart';
import '../features/dashboard/presentation/pages/dashboard_page.dart';




import '../features/onboarding/onboard_binding.dart';

import '../features/onboarding/presentation/pages/splash.dart';



class Routers {
  static final route = [
    GetPage(
        name: SplashPage.routeName,
        page: () => const SplashPage(),
        bindings: [OnBoardingBinding()]),
    //Dashboard
    GetPage(
        name: DashboardPage.routeName,
        page: () => DashboardPage(),
        bindings: [DashboardBinding()]),


    //CurrencySelection
    GetPage(
        name: CurrencySelectionPage.routeName,
        page: () => CurrencySelectionPage(),
        bindings: [CurrencySelectionBinding()]),








  ];
}
