import 'package:flutter/material.dart';
import 'package:testdog/core/assets.dart';
import 'package:testdog/core/design_system.dart';

class DogWidget extends StatelessWidget {
  final VoidCallback onTap;
  const DogWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: DesignSystem.colors.dog,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(onPressed: onTap, icon: Image.asset(Assets.dog)),
      ),
    );
  }
}
