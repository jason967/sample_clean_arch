import 'package:flutter/material.dart';

import 'core/theme/theme_data.dart';
import 'core/utils/rest_client/rest_client.dart';
import 'data/data_source/remote/display_api.dart';
import 'data/repository_impl/display.repositoryImpl.dart';
import 'presentation/test_page/test_page.dart';

void main() async {
  final dio = RestClient().getDio;

  final DisplayApi displayApi = DisplayApi(RestClient().getDio);

  // final apiResponse =
  //     await DisplayRepositoryImpl(displayApi).getMenusByMallType('market', {});
  // print(apiResponse);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const TestPage(),
      title: 'Flutter Demo',
      theme: CustomThemeData.themeData,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: 'Increment',
        onPressed: _incrementCounter,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
