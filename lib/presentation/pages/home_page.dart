import 'package:flutter/material.dart';
import 'package:testdog/core/navigation.dart';
import 'package:testdog/presentation/components/cat_widget.dart';
import 'package:testdog/presentation/components/dog_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CatWidget(
              onTap: () {
                Navigator.pushNamed(context, Navigation.routeNames.cat);
              },
            ),
            DogWidget(
              onTap: () {
                Navigator.pushNamed(context, Navigation.routeNames.dog);
              },
            ),
          ],
        ),
      ),
    );
  }
}
