// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries :
// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=F9A2A3A7-F235-4FDD-8AA1-D4355C0DC0A3
// https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca

import 'package:dio/dio.dart';

class FruitDio {
  static Dio dio;

  static defineDio() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://api.sandbox.checkout.com/',
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> dioPostData(
      {String url, String key, Map<String, dynamic> data}) async {
    dio.options.headers = {
      'Authorization': key,
      'Content-Type': 'application/json'
    };
    return await dio.post(
      url,
      data: data,
    );
  }

  static Future<Response> dioGetData(
      String url, Map<String, dynamic> query) async {
    return await dio.get(url, queryParameters: query);
  }
}
