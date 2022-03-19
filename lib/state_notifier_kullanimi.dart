import 'package:flutter/material.dart';
import 'package:flutter_ders_state_management/all_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StateNotifierKullanimi extends StatelessWidget {
  const StateNotifierKullanimi({Key? key}) : super(key: key);

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
            var title = ref.watch(title2Povider);
            return Text(title);
          })),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              MyText(),
              MyCounterText(),
              CiftMiWidget(),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            MyFloatingActionButton(),
            SizedBox(
              height: 20,
            ),
            MyFloatingAction(),
          ],
        ));
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('MyCounterText build tetiklendi');
    var sayac = ref.watch(sayacNotifierProvider);

    return Text(
      sayac.sayacDegeri.toString(),
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
        //ref.read(sayacNotifierProvider) bize SayacModeli verir.
        //Arttırma ve azaltma metodları sayacManager sınıfında olduğundan
        //bu sınıfa erişmek için .notifier kullanılır.
        ref.read(sayacNotifierProvider.notifier).arttir();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class MyFloatingAction extends ConsumerWidget {
  const MyFloatingAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('MyFloatingAction build tetiklendi');
    return FloatingActionButton(
      onPressed: () {
        //ref.read(sayacNotifierProvider) bize SayacModeli verir.
        //Arttırma ve azaltma metodları sayacManager sınıfında olduğundan
        //bu sınıfa erişmek için .notifier kullanılır.
        ref.read(sayacNotifierProvider.notifier).azalt();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.exposure_minus_1),
    );
  }
}

class CiftMiWidget extends ConsumerWidget {
  const CiftMiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ciftMi = ref.watch(ciftMiProvider);
    return Text(ciftMi ? 'ÇİFT' : 'TEK');
  }
}
