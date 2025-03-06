import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testdog/core/enums/page_status.dart';
import 'package:testdog/domain/repositories/dog_repository.dart';
import 'package:testdog/presentation/pages/dog/dog_state.dart';

final class DogCubit extends Cubit<DogState> {
  final DogRepository _dogRepository;

  DogCubit({required DogRepository dogRepository})
    : _dogRepository = dogRepository,
      super(DogState.initial());

  void getDog() async {
    emit(state.copyWith(status: PageStatus.loading));
    final response = await _dogRepository.getDog();
    emit(state.copyWith(status: PageStatus.loaded, imageUrl: () => response));
  }
}
