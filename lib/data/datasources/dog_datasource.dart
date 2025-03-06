import 'package:testdog/core/endpoints.dart';
import 'package:testdog/core/rest_client.dart';

abstract interface class DogDatasource {
  Future<dynamic> getDog();
}

final class DogDatasourceImpl implements DogDatasource {
  final RestClient _restClient;

  DogDatasourceImpl({required RestClient restClient})
    : _restClient = restClient;
  @override
  Future<dynamic> getDog() async {
    return _restClient.get(path: Endpoints.getDogImages);
  }
}
