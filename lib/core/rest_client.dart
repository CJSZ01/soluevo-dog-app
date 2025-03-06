import 'package:dio/dio.dart';

abstract interface class RestClient {
  Future<dynamic> get({required String path});
}

final class DioRestClient implements RestClient {
  final dio = Dio();

  @override
  Future<dynamic> get({required String path}) async {
    final response = await dio.get(path);
    return response.data;
  }
}
