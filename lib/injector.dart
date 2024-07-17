import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //controller

  //use cases

  //______________________________________________________________________________
  //repository

  //______________________________________________________________________________
  //data source

  //core


  // external
  final SharedPref sharedPref = SharedPref();

  sl.registerLazySingleton(() => sharedPref);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}
