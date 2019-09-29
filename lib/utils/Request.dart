import 'package:dio/dio.dart';
import 'package:flutter_luckin_coffee/utils/initDio.dart';



class Request {
  static Dio _dio = initDio();

  static get(String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    Response res = await _dio.get(
      path, 
      queryParameters: queryParameters,
      options: Options(
        method: "GET"
      ), 
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress
    );

    
    return res.data;
  }
}