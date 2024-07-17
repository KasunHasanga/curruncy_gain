
import 'dart:math';

import 'package:intl/intl.dart';



// NumberFormat oCcy = NumberFormat("#,##0.00", "en_UK");
NumberFormat oCcy = NumberFormat("#,##0.00", "da_DK");

class Helper {
  static final Helper _helper = Helper._internal();

  factory Helper() {
    return _helper;
  }

  Helper._internal();


  int calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    var distance= 1000*12742 * asin(sqrt(a));
    return distance.round() ;
  }


  String convertMetersToKmAndM(int meters) {
    int kilometers = meters ~/ 1000; // Using integer division to get the whole number of kilometers
    int remainingMeters = meters % 1000; // Getting the remaining meters after converting to kilometers

    if (kilometers > 0 && remainingMeters > 0) {
      return '$kilometers km and $remainingMeters m';
    } else if (kilometers > 0) {
      return '$kilometers km';
    } else {
      return '$meters m';
    }
  }


}
