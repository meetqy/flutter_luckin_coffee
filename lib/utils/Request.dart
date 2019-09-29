import 'package:dio/dio.dart';

class Request {
  Dio _dio;

  Request() {
    _dio = _initDio();
  }

  get(String path, {
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

  Dio _initDio() {
    BaseOptions _baseOptions = BaseOptions(
      baseUrl: "https://api.it120.cc/b956ecefe528bcc1fd922fd4458913d9",   
    );

    Dio dio = Dio(_baseOptions);
    
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:(RequestOptions options) async {
          // 在请求被发送之前做一些事情
          return options; //continue
          // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
          // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
          //
          // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
          // 这样请求将被中止并触发异常，上层catchError会被调用。
        },
        onResponse:(Response response) async {
          // 在返回响应数据之前做一些预处理
          return response; 
        },
        onError: (DioError e) async {
          // 当请求失败时做一些预处理
          return e;//continue
        }
      )
    );

    return dio;
  }
}



