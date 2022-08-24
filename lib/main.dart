import 'dart:math';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:janken/provider/jankenProvider.dart';

import 'model/janken.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JnakenPage(),
    );
  }
}

class JnakenPage extends HookConsumerWidget {
  const JnakenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final myHandNotifier = ref.watch(myHandProvider.notifier);
    final myHand = ref.watch(myHandProvider);

    final computerHandNotifier = ref.watch(computerHandProvider.notifier);
    final computerHand = ref.watch(computerHandProvider);

    final jankenResult = ref.watch(jankenResultProvider);

    final numberOfMatchesController = ref.watch(numberOfMatchesProvider.notifier);
    final numberOfWinsController = ref.watch(numberOfWinsProvider.notifier);
    final winPercent = ref.watch(winPercentProvider);
    
    void jankenpon(String hand) {
      myHandNotifier.state = hand;
      computerHandNotifier.state = ['✊','✌️','✋',][Random().nextInt(2)];
      switch (jankenResult){
        case 'かち':
          numberOfMatchesController.state++;
          numberOfWinsController.state++;
          break;
        case 'まけ':
          numberOfMatchesController.state++;
          break;
        case 'ひきわけ':
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '${winPercent.toStringAsFixed(1)}%',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 40,),
            Text(
                jankenResult,
              style: TextStyle(
                fontSize: 30
              ),
            ),
            SizedBox(height: 48,),
            Text(
                computerHand,
              style: TextStyle(
                fontSize: 50
              ),
            ),
            SizedBox(height: 48,),
            Text(
              myHand,
              style: TextStyle(
                  fontSize: 50
              ),
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: (){
                      jankenpon('✊');
                    },
                    child: Text('✊')
                ),
                ElevatedButton(
                    onPressed: (){
                      jankenpon('✌️');
                    },
                    child: Text('✌️')
                ),
                ElevatedButton(
                    onPressed: (){
                      jankenpon('✋');
                    },
                    child: Text('✋')
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
