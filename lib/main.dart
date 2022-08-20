import 'dart:math';
import 'model/janken.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

class JnakenPage extends StatefulWidget {
  const JnakenPage({Key? key}) : super(key: key);

  @override
  State<JnakenPage> createState() => _JnakenPageState();
}

class _JnakenPageState extends State<JnakenPage> {
  var myHand = '✊';
  var computerHand = '✊';
  var jankenResult = 'あいこ';
  final jankenSystem = JankenSystem();
  void jankenpon(String hand) {
    myHand = hand;
    computerHand = ['✊','✌️','✋',][Random().nextInt(2)];
    jankenResult = jankenSystem.result(myHand, computerHand);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
