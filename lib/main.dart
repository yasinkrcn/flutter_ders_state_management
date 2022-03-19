import 'package:flutter/material.dart';
import 'package:flutter_ders_state_management/riverpod_basic.dart';
import 'package:flutter_ders_state_management/state_notifier_kullanimi.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: StateNotifierKullanimi()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyText(),
            MyCounterText(sayac: _counter),
          ],
        ),
      ),
      floatingActionButton: MyFloatingActionButton(onArttir: () {
        _counter++;
        setState(() {});
      }),
    );
  }
}

class MyCounterText extends StatelessWidget {
  final int sayac;
  const MyCounterText({Key? key, required this.sayac}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      sayac.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You have pushed the button this many times:',
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  VoidCallback onArttir;

  MyFloatingActionButton({Key? key, required this.onArttir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onArttir();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
