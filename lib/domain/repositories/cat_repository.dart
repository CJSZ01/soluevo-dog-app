import 'package:testdog/data/datasources/cat_datasource.dart';

abstract interface class CatRepository {
  Future<String?> getCat();
}

final class CatRepositoryImpl implements CatRepository {
  final CatDatasource _catDatasource;

  CatRepositoryImpl({required CatDatasource catDatasource})
    : _catDatasource = catDatasource;
  @override
  Future<String?> getCat() async {
    final response = await _catDatasource.getCat();
    if (response != null) {
      return response.first['url'];
    } else {
      return null;
    }
  }
}
