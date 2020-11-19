import 'package:country/api/apiservice.dart';
import 'package:country/ui/home.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    ApiService apiService = ApiService(dio);
    Get.put(apiService);
    dio.transformer = FlutterTransformer();
    dio.interceptors.add(DioCacheManager(
            CacheConfig(baseUrl: 'https://restcountries.eu/rest/v2/'))
        .interceptor);
    dio.interceptors.add(PrettyDioLogger());
    //PrettyDioLogger(responseBody: true, logPrint: (log) => print(log))
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
