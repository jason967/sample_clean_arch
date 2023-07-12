import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/test_bloc.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TestBloc(),
      child: const TestView(),
    );
  }
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TestBloc, TestState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initialized:
            case Status.loading:
              return CircularProgressIndicator();
            case Status.success:
              return Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('버튼'),
                ),
              );
            case Status.failure:
              return Center(
                child: Text('쨔스!'),
              );
          }
        },
      ),
    );
  }
}
