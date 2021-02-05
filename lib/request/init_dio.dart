import 'package:dio/dio.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

/// 初始化dio
Dio initDio() {
  BaseOptions _baseOptions = BaseOptions(
    baseUrl: "https://api.it120.cc/b956ecefe528bcc1fd922fd4458913d9",   
  );

  Dio dio = Dio(_baseOptions);
  
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest:(RequestOptions options) async {
        if(G.user.data != null) {
          options.queryParameters['token'] = G.user.data.token;
        }
        
        return options; 
        // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onResponse:(Response response) async {
        // 在返回响应数据之前做一些预处理
        if(response.data['code'] != 0) {
          await G.toast(response.data['msg']);
          response.data = null;
        }
        return response;
      },
      onError: (DioError e) async {
         G.toast(e.message);
        // 当请求失败时做一些预处理
        return e;//continue
      }
    )
  );

  return dio;
}
