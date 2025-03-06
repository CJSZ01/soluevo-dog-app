import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testdog/core/enums/page_status.dart';
import 'package:testdog/domain/repositories/cat_repository.dart';

import 'package:testdog/presentation/pages/cat/cat_state.dart';

final class CatCubit extends Cubit<CatState> {
  final CatRepository _catRepository;

  CatCubit({required CatRepository catRepository})
    : _catRepository = catRepository,
      super(CatState.initial());

  void getCat() async {
    emit(state.copyWith(status: PageStatus.loading));
    final response = await _catRepository.getCat();
    emit(state.copyWith(status: PageStatus.loaded, imageUrl: () => response));
  }
}
