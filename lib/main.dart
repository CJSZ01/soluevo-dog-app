import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:testdog/core/design_system.dart';
import 'package:testdog/core/navigation.dart';
import 'package:testdog/core/rest_client.dart';
import 'package:testdog/data/datasources/cat_datasource.dart';
import 'package:testdog/data/datasources/dog_datasource.dart';
import 'package:testdog/domain/repositories/cat_repository.dart';
import 'package:testdog/domain/repositories/dog_repository.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton<RestClient>(() => DioRestClient());
  getIt.registerLazySingleton<DogDatasource>(
    () => DogDatasourceImpl(restClient: getIt.get()),
  );
  getIt.registerLazySingleton<DogRepository>(
    () => DogRepositoryImpl(dogDatasource: getIt.get()),
  );
  getIt.registerLazySingleton<CatDatasource>(
    () => CatDatasourceImpl(restClient: getIt.get()),
  );
  getIt.registerLazySingleton<CatRepository>(
    () => CatRepositoryImpl(catDatasource: getIt.get()),
  );
  runApp(const DogApp());
}

class DogApp extends StatelessWidget {
  const DogApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cats & Dogs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: DesignSystem.colors.background,
        ),
        scaffoldBackgroundColor: DesignSystem.colors.background,
      ),
      routes: Navigation.routes,
    );
  }
}
