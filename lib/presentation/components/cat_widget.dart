import 'package:flutter/material.dart';
import 'package:testdog/core/assets.dart';
import 'package:testdog/core/design_system.dart';

class CatWidget extends StatelessWidget {
  final VoidCallback onTap;
  const CatWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: DesignSystem.colors.cat,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(onPressed: onTap, icon: Image.asset(Assets.cat)),
      ),
    );
  }
}
