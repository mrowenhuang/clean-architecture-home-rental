import 'package:clean_architecture_rental_room/core/network/api_network.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class Conn {
  static final Dio _dio = Dio(BaseOptions(baseUrl: ApiNetwork.api));

  static Dio get dio {
    _setUpInterceptor();
    return _dio;
  }

  static final GetStorage _storage = GetStorage();

  static void _setUpInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await _storage.read("access_token");

          if (accessToken != null) {
            options.headers['Authorization'] = "Bearer $accessToken";
          }

          options.headers['Accept'] = "application/json";
          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response != null) {
            throw (error.response?.data);
          }

          return handler.next(error);
        },
        onResponse: (response, handler) {
          if (response.statusCode == 401) {
            print(response);
          }

          return handler.next(response);
        },
      ),
    );
  }
}
