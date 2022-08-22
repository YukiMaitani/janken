import '../model/janken.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myHandProvider = StateProvider<String>((ref) => '✊');
final computerHandProvider = StateProvider<String>((ref) => '✊');
final jankenResultProvider = Provider((ref) {
  final jankenSystem = JankenSystem();
  final String myHand = ref.watch(myHandProvider);
  final String computerHand = ref.watch(computerHandProvider);
  final result = jankenSystem.result(myHand, computerHand);
  return result;
});
