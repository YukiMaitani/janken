import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/janken.dart';

final myHandProvider = StateProvider<String>((ref) => '✊');
final computerHandProvider = StateProvider<String>((ref) => '✊');
final numberOfWinsProvider = StateProvider<int>((ref) => 0);
final numberOfMatchesProvider = StateProvider<int>((ref) => 0);

final jankenResultProvider = Provider((ref) {
  final jankenSystem = JankenSystem();
  final String myHand = ref.watch(myHandProvider);
  final String computerHand = ref.watch(computerHandProvider);
  final result = jankenSystem.result(myHand, computerHand);

  return result;
});

final winPercentProvider = Provider((ref){
  final numberOfWins = ref.watch(numberOfWinsProvider);
  final numberOfMatches = ref.watch(numberOfMatchesProvider);

  return (numberOfWins/numberOfMatches).isNaN ? 0.0 : numberOfWins/numberOfMatches * 100;
});