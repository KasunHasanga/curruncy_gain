

import 'package:currency_grain/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/colors.dart';
import '../config/constants.dart';
import '../config/fonts.dart';
import '../config/theme/theme_service.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key,required this.dashboardController});

  final DashboardController dashboardController;
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(gradient: AppColors.appbarGradient),
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
