import 'package:testdog/core/endpoints.dart';
import 'package:testdog/core/rest_client.dart';

abstract interface class CatDatasource {
  Future<dynamic> getCat();
}

final class CatDatasourceImpl implements CatDatasource {
  final RestClient _restClient;

  CatDatasourceImpl({required RestClient restClient})
    : _restClient = restClient;
  @override
  Future<dynamic> getCat() async {
    return _restClient.get(path: Endpoints.getCatImages);
  }
}
