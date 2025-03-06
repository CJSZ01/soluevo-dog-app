import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testdog/core/enums/page_status.dart';
import 'package:testdog/presentation/components/dog_widget.dart';
import 'package:testdog/presentation/pages/dog/dog_cubit.dart';
import 'package:testdog/presentation/pages/dog/dog_state.dart';

class DogPage extends StatefulWidget {
  const DogPage({super.key});

  @override
  State<DogPage> createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  late final DogCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<DogCubit, DogState>(
          builder:
              (context, state) => switch (state.status) {
                PageStatus.initial => initialDog(),

                PageStatus.loading => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('Carregando'),
                        SizedBox(height: 32),
                        CircularProgressIndicator(),
                      ],
                    ),
                  ],
                ),

                PageStatus.loaded =>
                  state.imageUrl == null
                      ? initialDog()
                      : InkWell(
                        onTap: () => _cubit.getDog(),
                        child: Image.network(state.imageUrl!),
                      ),
              },
        ),
      ),
    );
  }

  Column initialDog() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text('Toque na imagem para carregar'),
            SizedBox(height: 32),
            DogWidget(
              onTap: () {
                _cubit.getDog();
              },
            ),
          ],
        ),
      ],
    );
  }
}
