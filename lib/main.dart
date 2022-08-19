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
                'あいこ',
              style: TextStyle(
                fontSize: 30
              ),
            ),
            SizedBox(height: 48,),
            Text(
                '✊',
              style: TextStyle(
                fontSize: 50
              ),
            ),
            SizedBox(height: 48,),
            Text('✊',
              style: TextStyle(
                  fontSize: 50
              ),
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: (){},
                    child: Text('✊')
                ),
                ElevatedButton(
                    onPressed: (){},
                    child: Text('✌️')
                ),
                ElevatedButton(
                    onPressed: (){},
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
