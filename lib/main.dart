
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'config/localization/translation.dart';
import 'config/routes.dart';
import 'config/theme/theme_service.dart';
import 'config/theme/themes.dart';
import 'features/onboarding/presentation/pages/splash.dart';
import 'injector.dart' as di;
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await di.init();
  await GetStorage.init('MyPref');
  mainDelegate();
}

void mainDelegate() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: ".env");
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late ThemeMode themeMode;

  @override
  void initState(){
    // TODO: implement initState
    themeMode = ThemeService().theme;
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp  (
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: themeMode,
      initialRoute: SplashPage.routeName,
      getPages: Routers.route,
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
    );
  }
}

