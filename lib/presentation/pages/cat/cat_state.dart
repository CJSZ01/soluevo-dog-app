import 'package:flutter/material.dart';
import 'package:testdog/core/enums/page_status.dart';

final class CatState {
  final PageStatus status;
  final String? imageUrl;

  CatState.initial({this.status = PageStatus.initial, this.imageUrl});
  CatState({required this.status, this.imageUrl});

  CatState copyWith({PageStatus? status, ValueGetter<String?>? imageUrl}) {
    return CatState(
      status: status ?? this.status,
      imageUrl: imageUrl != null ? imageUrl() : this.imageUrl,
    );
  }
}
