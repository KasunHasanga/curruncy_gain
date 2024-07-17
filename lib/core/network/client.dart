import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as lan;

import '../../utils/url_path.dart';
import '../error/logger.dart';
import '../widgets/popup_no_network.dart';

class Clinet {
  static BaseOptions opts = BaseOptions(
    baseUrl: AppURLPath.baseURL,
    responseType: ResponseType.json,
    // connectTimeout: 30000,
    // receiveTimeout: 30000,
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            log("🐛 REQUEST URI: ${options.uri}");
            log("🐛 REQUEST QUERY: ${options.queryParameters}");
            //log("🐛 REQUEST DATA: "+options.data.toString());
          },
          onResponse: (response, handler){
            if (kDebugMode) {
              print(response);
            }
            log("🐛 RESPONSE CODE: ${response.statusCode}");
            log("🐛 RESPONSE MESSAGE: ${response.statusMessage}");
            log("🐛 RESPONSE DATA: ${response.data}");
          },
          onError: (DioException error, handler){
            log("🐛 RESPONSE ERROR: ${error.error}");
          }
        ),
      );
  }

  static dynamic requestInterceptor(RequestOptions options) async {
    // Get your JWT token
    const token = '';
    options.headers.addAll({"Authorization": "Bearer: $token"});
    return options;
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response?> get(String url, {Map<String, dynamic>? query = null, dynamic data = null, required GlobalKey<ScaffoldState> scaffoldKey}) async {
   print(url);
    try {
      Response? response = await dio.get(url, queryParameters: query);
      Logger.Yellow.log("🐛 RESPONSE statusCode ${response.statusCode}");
      Logger.Blue.log("🐛 REQUEST URL $url");
      Logger.Blue.log("🐛 REQUEST URL ${response.realUri.host}${response.realUri.path}${response.realUri.query}");
      if(query!=null){Logger.Blue.log("🐛 REQUESt query ${jsonDecode(jsonEncode(query))}");}
      if(data!=null){Logger.Blue.log("🐛 REQUESt data ${jsonDecode(jsonEncode(data))}");}
      Logger.Blue.log("🐛 RESPONSE data ${response.data}");
      return response;
    } on DioException catch(e) {
      if(e.type == DioExceptionType.connectionError){
        noNetWorkBottomSheetOpen(scaffoldKey);
      }else{
        noNetWorkBottomSheetOpen(scaffoldKey, title: 'sys_error_t'.tr, description: 'sys_error_d'.tr);
      }
      Logger.Red.log("🐛 RESPONSE ERROR: $e");
    }
  }

  Future<Response?> post(String url,  {Map<String, dynamic>? query = null, dynamic data = null, required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      Response response = await dio.post(url, queryParameters: query, data: data);
      Logger.Yellow.log("🐛 RESPONSE statusCode ${response.statusCode}");
      Logger.Blue.log("🐛 REQUEST URL $url");
      Logger.Blue.log("🐛 REQUEST URL ${response.realUri.host}${response.realUri.path}${response.realUri.query}");
      if(query!=null){Logger.Blue.log("🐛 REQUESt query ${jsonDecode(jsonEncode(query))}");}
      if(data!=null){Logger.Blue.log("🐛 REQUESt data ${jsonDecode(jsonEncode(data))}");}
      Logger.Blue.log("🐛 RESPONSE data ${response.data}");
      return response;
    } on DioException catch(e) {
      if(e.type == DioExceptionType.connectionError){
        noNetWorkBottomSheetOpen(scaffoldKey);
      }else{
        noNetWorkBottomSheetOpen(scaffoldKey, title: 'sys_error_t'.tr, description: 'sys_error_d'.tr);
      }
      Logger.Red.log("🐛 RESPONSE ERROR: $e");
    }
  }

  Future<Response?> put(String url,  {Map<String, dynamic>? query = null, dynamic data = null, required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      Response response = await baseAPI.put(url, queryParameters: query, data: data);
      Logger.Yellow.log("🐛 RESPONSE statusCode ${response.statusCode}");
      Logger.Blue.log("🐛 REQUEST URL $url");
      Logger.Blue.log("🐛 REQUEST URL ${response.realUri.host}${response.realUri.path}${response.realUri.query}");
      if(query!=null){Logger.Blue.log("🐛 REQUESt query ${jsonDecode(jsonEncode(query))}");}
      if(data!=null){Logger.Blue.log("🐛 REQUESt data ${jsonDecode(jsonEncode(data))}");}
      Logger.Blue.log("🐛 RESPONSE data ${response.data}");
      return response;
    } on DioException catch(e) {
      if(e.type == DioExceptionType.connectionError){
        noNetWorkBottomSheetOpen(scaffoldKey);
      }else{
        noNetWorkBottomSheetOpen(scaffoldKey, title: 'sys_error_t'.tr, description: 'sys_error_d'.tr);
      }
      Logger.Red.log("🐛 RESPONSE ERROR: $e");
    }
  }

  Future<Response?> deleteHTTP(String url, {Map<String, dynamic>? query = null, dynamic data = null, required GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      Response response = await baseAPI.delete(url, queryParameters: query, data: data);
      Logger.Yellow.log("🐛 RESPONSE statusCode ${response.statusCode}");
      Logger.Blue.log("🐛 REQUEST URL $url");
      Logger.Blue.log("🐛 REQUEST URL ${response.realUri.host}${response.realUri.path}${response.realUri.query}");
      if(query!=null){Logger.Blue.log("🐛 REQUESt query ${jsonDecode(jsonEncode(query))}");}
      if(data!=null){Logger.Blue.log("🐛 REQUESt data ${jsonDecode(jsonEncode(data))}");}
      Logger.Blue.log("🐛 RESPONSE data ${response.data}");
      return response;
    } on DioException catch(e) {
      if(e.type == DioExceptionType.connectionError){
        noNetWorkBottomSheetOpen(scaffoldKey);
      }else{
        noNetWorkBottomSheetOpen(scaffoldKey, title: 'sys_error_t'.tr, description: 'sys_error_d'.tr);
      }
      Logger.Red.log("🐛 RESPONSE ERROR: $e");
    }
  }
}