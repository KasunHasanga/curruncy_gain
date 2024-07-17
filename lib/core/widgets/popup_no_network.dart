

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/constants.dart';
import '../../../../../config/fonts.dart';
// import 'package:flutter_svg/flutter_svg.dart';

Future noNetWorkBottomSheetV2({
  required BuildContext context,
}) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          width: Get.width,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  margin: const EdgeInsets.only(bottom: 20, top: 6),
                ),
              ),
              Text(
                'no_network_t'.tr,
                style: AppFonts.styleWithGilroyMediumText(
                    color: Theme.of(context).colorScheme.onBackground,
                    fSize: FontSizeValue.fontSize28),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image.asset(AllImages().imgNoData, scale: 3,),
                    SizedBox(height: 20,),
                    Text(
                      'no_network_d'.tr,
                      style: AppFonts.styleWithGilroyMediumText(
                          color: Theme.of(context).colorScheme.onBackground,
                          fSize: FontSizeValue.fontSize20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}

PersistentBottomSheetController? controller;

void noNetWorkBottomSheetOpen(GlobalKey<ScaffoldState> scaffoldKey, {ValueSetter<bool>? callback, String? title, String? description}) {
  if(title==null){title='no_network_t'.tr;}
  if(description==null){description='no_network_d'.tr;}
  controller =
      scaffoldKey.currentState!.showBottomSheet<Null>(
          backgroundColor: Colors.transparent,
        (BuildContext context) {
        return GestureDetector(
          onTap: (){noNetWorkBottomSheetClose();},
          child: Container(
              height: Get.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.5)
                  ],
                ),
              ),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       height: Get.height*0.4,
              //       padding: EdgeInsets.all(10),
              //       alignment: Alignment.bottomCenter,
              //       decoration: BoxDecoration(
              //           color: Theme.of(scaffoldKey.currentState!.context).colorScheme.background,
              //           borderRadius: BorderRadius.only(
              //               topLeft: Radius.circular(20),
              //               topRight: Radius.circular(20)
              //           )
              //       ),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: <Widget>[
              //           SvgPicture.asset(
              //             AllImages().noNetwork,
              //             // colorFilter: const ColorFilter.mode(AppColors.kAliceBlue, BlendMode.srcIn),
              //             semanticsLabel: '',
              //             // width: 24.0,
              //             // height: 24.0,
              //           ),
              //           SizedBox(height: 20,),
              //           Text(
              //             '$title',
              //             style: AppFonts.styleWithGilroyMediumText(
              //                 color: Theme.of(context).colorScheme.onBackground,
              //                 fSize: FontSizeValue.fontSize18),
              //           ),
              //           SizedBox(height: 5,),
              //           Text(
              //             '$description',
              //             textAlign: TextAlign.left,
              //             style: AppFonts.styleWithGilroyMediumText(
              //                 color: Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
              //                 fSize: FontSizeValue.fontSize14,
              //                 fontWeight: FontWeight.normal
              //             ),
              //           ),
              //           SizedBox(height: 20,),
              //           Padding(
              //             padding: EdgeInsets.only(left: 20, right: 20),
              //             child: AppButton(
              //               backgroundColor: AppColors.kPrimary,
              //               title: "no_network_b".tr,
              //               action: () {
              //                 noNetWorkBottomSheetClose();
              //                 if(callback!=null){callback.call(true);}
              //               },
              //             ),
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // )
          ),
        );
      });
}

void noNetWorkBottomSheetClose() {
  if (controller != null) {
    controller!.close();
    controller = null;
  }
}