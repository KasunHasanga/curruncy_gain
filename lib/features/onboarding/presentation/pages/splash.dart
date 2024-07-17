import 'package:currency_grain/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../../config/bank_images.dart';
import '../controller/onboarding_controller.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash_page';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  OnBoardingController onBoardingController = Get.find();

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    onBoardingController.checkSessionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: Center(
        child: SizedBox(
          width: 180,
          height: 180,
          child: Image(
            image: AssetImage( AllImages().splashLogo),
          ),
        ),
      ),
    );
  }
}
