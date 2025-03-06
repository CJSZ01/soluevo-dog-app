import 'package:flutter/material.dart';
import 'package:testdog/core/enums/page_status.dart';

final class DogState {
  final PageStatus status;
  final String? imageUrl;

  DogState.initial({this.status = PageStatus.initial, this.imageUrl});
  DogState({required this.status, this.imageUrl});

  DogState copyWith({PageStatus? status, ValueGetter<String?>? imageUrl}) {
    return DogState(
      status: status ?? this.status,
      imageUrl: imageUrl != null ? imageUrl() : this.imageUrl,
    );
  }
}
