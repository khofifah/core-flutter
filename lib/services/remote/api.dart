import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:learning_flutter/services/interceptors/dio_connectifity_retrier.dart';
import 'package:learning_flutter/services/interceptors/retry_interceptor.dart';
import 'package:learning_flutter/utils/constant.dart';

class Api {
  Api() {
    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(responseBody: true));
    }
    dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: Dio(),
          connectivity: Connectivity(),
        ),
      ),
    );
  }

  final String apiBaseUrl = '$baseUrl/employee';
  final Dio dio = Dio();

  Future<Response<dynamic>> wrapE(
      Future<Response<dynamic>> Function() dioApi) async {
    try {
      return await dioApi();
    } catch (error) {
      if (error is DioError && error.type == DioErrorType.RESPONSE) {
        final Response<dynamic> response = error.response;
        final String errorMessage =
            'Code ${response.statusCode} - ${response.statusMessage}';
        throw DioError(
          request: error.request,
          response: error.response,
          type: error.type,
          error: errorMessage,
        );
      }
      rethrow;
    }
  }
}
