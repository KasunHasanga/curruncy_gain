import 'package:currency_grain/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/colors.dart';
import '../config/constants.dart';
import '../config/fonts.dart';
import '../config/theme/theme_service.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key, required this.dashboardController});

  final DashboardController dashboardController;
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final Uri _url = Uri.parse('https://www.linkedin.com/in/kasun-hasanga/');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(gradient: AppColors.appbarGradient),
            child: Text(
              'kasun Hasanga',
              style: AppFonts.styleWithGilroyMediumText(
                  color: Theme.of(context).colorScheme.onBackground,
                  fSize: FontSizeValue.fontSize28),
            ),
          ),
          ListTile(
            title: Text(
              'Linkdin',
              style: AppFonts.styleWithGilroyMediumText(
                  color: Theme.of(context).colorScheme.onBackground,
                  fSize: FontSizeValue.fontSize16),
            ),
            onTap: () {
              _launchUrl();
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
                  widget.dashboardController.isLightModeSelected.value = !value;
                  ThemeService().switchTheme(value);
                  widget.dashboardController.isAuto.value = false;
                },
                value: !widget.dashboardController.isLightModeSelected.value,
              ),
            ),
          )
        ],
      ),
    );
  }
}
