import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:testdog/domain/repositories/cat_repository.dart';
import 'package:testdog/domain/repositories/dog_repository.dart';
import 'package:testdog/presentation/pages/cat/cat_cubit.dart';
import 'package:testdog/presentation/pages/cat/cat_page.dart';
import 'package:testdog/presentation/pages/dog/dog_cubit.dart';
import 'package:testdog/presentation/pages/dog/dog_page.dart';
import 'package:testdog/presentation/pages/home_page.dart';

final class Navigation {
  Navigation._();
  static final routeNames = _Routes();
  static Map<String, WidgetBuilder> routes = {
    routeNames.home: (_) => HomePage(),
    routeNames.cat:
        (_) => BlocProvider<CatCubit>(
          create:
              (context) =>
                  CatCubit(catRepository: GetIt.I.get<CatRepository>()),
          child: CatPage(),
        ),
    routeNames.dog:
        (_) => BlocProvider<DogCubit>(
          create:
              (context) =>
                  DogCubit(dogRepository: GetIt.I.get<DogRepository>()),
          child: DogPage(),
        ),
  };
}

final class _Routes {
  final String home = '/';
  final String cat = '/cat';
  final String dog = '/dog';
}
