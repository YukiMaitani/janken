import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/janken.dart';

final myHandProvider = StateProvider<String>((ref) => '✊');
final computerHandProvider = StateProvider<String>((ref) => '✊');
final numberOfMatchesProvider = StateProvider<int>((ref) => 0);
final numberOfWinsProvider = StateProvider<int>((ref) => 0);

final jankenResultProvider = Provider((ref) {
  final jankenSystem = JankenSystem();
  final String myHand = ref.watch(myHandProvider);
  final String computerHand = ref.watch(computerHandProvider);
  final numberOfMatchesController = ref.read(numberOfMatchesProvider.notifier);
  final numberOfWinsController = ref.read(numberOfWinsProvider.notifier);

  final result = jankenSystem.result(myHand, computerHand);

  switch (result) {
    case 'かち':
      numberOfMatchesController.state++;
      numberOfWinsController.state++;
      break;
    case 'まけ':
      numberOfMatchesController.state++;
      break;
  }

  return result;
});

final winPercentProvider = Provider((ref) {
  final numberOfMatches = ref.watch(numberOfMatchesProvider);
  final numberOfWins = ref.watch(numberOfWinsProvider);
  final winPercent = numberOfWins/numberOfMatches;
  return winPercent;
});
