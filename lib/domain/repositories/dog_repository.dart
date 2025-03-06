import 'package:testdog/data/datasources/dog_datasource.dart';

abstract interface class DogRepository {
  Future<String?> getDog();
}

final class DogRepositoryImpl implements DogRepository {
  final DogDatasource _dogDatasource;

  DogRepositoryImpl({required DogDatasource dogDatasource})
    : _dogDatasource = dogDatasource;
  @override
  Future<String?> getDog() async {
    final response = await _dogDatasource.getDog();
    if (response != null) {
      return response['message'];
    } else {
      return null;
    }
  }
}
