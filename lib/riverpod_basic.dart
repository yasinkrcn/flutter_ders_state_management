import 'package:flutter/material.dart';
import 'package:flutter_ders_state_management/all_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodBasics extends StatelessWidget {
  const RiverpodBasics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('MaterialApp build tetiklendi');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('MyHomePage build tetiklendi');
    return Scaffold(
      appBar: AppBar(
        title: Consumer(builder: ((context, ref, child) {
          var title = ref.watch(titlePovider);
          return Text(title);
        })),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            MyText(),
            MyCounterText(),
          ],
        ),
      ),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('MyCounterText build tetiklendi');
    var sayac = ref.watch(sayacStateProvider);

    return Text(
      sayac.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyText extends ConsumerWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('MyText build tetiklendi');
    return Text(ref.watch(textProvider));
  }
}

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('MyFloatingAction build tetiklendi');
    return FloatingActionButton(
      onPressed: () {
        ref.read(sayacStateProvider.state).state++;
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
