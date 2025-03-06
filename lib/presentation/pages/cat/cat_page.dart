import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testdog/core/enums/page_status.dart';
import 'package:testdog/presentation/components/cat_widget.dart';
import 'package:testdog/presentation/pages/cat/cat_cubit.dart';
import 'package:testdog/presentation/pages/cat/cat_state.dart';

class CatPage extends StatefulWidget {
  const CatPage({super.key});

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  late final CatCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CatCubit, CatState>(
          builder:
              (context, state) => switch (state.status) {
                PageStatus.initial => initialCat(),

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
                      ? initialCat()
                      : InkWell(
                        onTap: () => _cubit.getCat(),
                        child: Image.network(state.imageUrl!),
                      ),
              },
        ),
      ),
    );
  }

  Column initialCat() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text('Toque na imagem para carregar'),
            SizedBox(height: 32),
            CatWidget(
              onTap: () {
                _cubit.getCat();
              },
            ),
          ],
        ),
      ],
    );
  }
}
