
import 'package:get/get.dart';

import '../../../../config/theme/theme_service.dart';
import '../../../../core/shared_preferences.dart';

class DashboardController extends GetxController {
  SharedPref sharedPref = SharedPref();

  @override
  void onInit() {
    // TODO: implement onInit
    isAuto.value = ThemeService().getAutoThemeStatus();
    if (isAuto.value) {
      isLightModeSelected.value = !ThemeService().currentThemeIsDark();
    } else {
      isLightModeSelected.value = !ThemeService().getThemeStatus();
    }
    super.onInit();
  }
  RxBool isLightModeSelected = false.obs;
  RxBool isAuto = false.obs;

}
