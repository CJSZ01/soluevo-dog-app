import 'package:flutter/material.dart';

final class DesignSystem {
  DesignSystem._();
  static const colors = _Colors();
}

final class _Colors {
  const _Colors();
  final Color background = const Color.fromRGBO(215, 217, 215, 1);
  final Color dog = const Color(0xFF646E68);
  final Color cat = const Color(0xFFB48EAE);
}
