import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_where_money_go/app/app_config.dart';

abstract class BaseService {
  static const String apiKey = AppConfig.easySlipApiKey;

  var dio = Dio(
    BaseOptions(
      headers: {
        Headers.contentTypeHeader: Headers.jsonContentType,
        'Authorization': 'Bearer $apiKey',
      },
    ),
  )..interceptors.add(LogInterceptor());

  Future post(String url, dynamic data, Function(dynamic data) returnCallback) async {
    Response response;

    try {
      debugPrint('Request : $data');
      response = await dio.post(url, data: data);
      debugPrint('Response : ${response.data}');
    } catch (error) {
      debugPrint('Error Response : $error');
      rethrow;
    }

    return returnCallback(response.data);
  }

  String getApiUrl(String controllerName, String actionName) {
    return '${AppConfig.easySlipApiServerUrl}/$controllerName/$actionName';
  }
}
