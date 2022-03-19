import 'package:flutter_ders_state_management/model/sayac_model.dart';
import 'package:flutter_ders_state_management/sayac_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final titlePovider = Provider<String>(((ref) => 'Riverpod Basics'));
final title2Povider =
    Provider<String>(((ref) => 'Riverpod State Notifier Kullanimi'));

final textProvider = Provider<String>((((ref) {
  return 'Butona basılma sayısı';
})));

final sayacStateProvider = StateProvider(((ref) {
  return 0;
}));

//1. Parametre yani SayacManager iş kodlarının, metodların olduğu dosyadır.
//Buna eişmek için ref.watch(sayacNotifierProvider.notifier) yazmamız gerekir.

//2. Parameter yani SayacModel ise bu provider'in state'idir.
//Buna erişmek için ref.watch(sayacNotifierProvider) demek gerekir.
//SayacModel sınıfındaki sayac değeri için var sayacDegeri = ref.watch(sayacNotifierProvider).sayacDegeri

final sayacNotifierProvider = StateNotifierProvider<SayacManager, SayacModel>(
  (ref) {
    return SayacManager();
  },
);

final ciftMiProvider = Provider<bool>((ref) {
  var sayacModel = ref.watch(sayacNotifierProvider);
  return sayacModel.sayacDegeri % 2 == 0;
});
