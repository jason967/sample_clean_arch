import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/constant/display.dart';
import '../../core/utils/dialog/common_dialog.dart';
import 'bloc/test_bloc.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          TestBloc()..add(TestInitialized(MallType.market)),
      child: const TestView(),
    );
  }
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('test')),
      body: Builder(builder: (context) {
        return BlocConsumer<TestBloc, TestState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.initialized:
                return Center(
                  child: Column(children: [
                    CircularProgressIndicator(),
                    const Text('초기화 중'),
                  ]),
                );
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.success:
                return Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Center(
                      child: ListView(
                        children:
                            state.menus.map((e) => Text(e.title)).toList(),
                      ),
                    ),
                  ),
                );
              case Status.failure:
                return Center(child: Text('서비스 오류!'));
            }
          },
          listener: (context, state) {
            if (state.status == Status.failure) {
              CommonDialog.networkErrorDialog(context, state.error!);
            }
          },
          listenWhen: (prev, curr) => prev.status != curr.status,
        );
      }),
    );
  }
}
