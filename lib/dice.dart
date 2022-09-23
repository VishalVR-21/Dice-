import 'dart:math';

import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {
  const DiceGame({Key? key}) : super(key: key);

  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  final diceList = const [
    'pictures/d1.jpg',
    'pictures/d2.jpg',
    'pictures/d3.png',
    'pictures/d4.png',
    'pictures/d5.png',
    'pictures/d6.png',
  ];
  final random = Random.secure();
  var index1 = 0;
  var index2 = 0;
  var score = 0;
  var diceSum = 0;
  var isOver = false;
  var sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text('Dice Game')),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FittedBox(
              child: Text(
                'Random Dice Generator',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  diceList[index1],
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  diceList[index2],
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            Text(
              'Dice Sum:$diceSum',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            //if (isOver)
            // Text(
            //   'GAME OVER',
            //   style: TextStyle(
            //       fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            // ),
            Text(
              'Wallet of sum is $sum',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
            ),

            ElevatedButton(
              onPressed: _rollTheDice,
              child: Text(
                'Roll',
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  _rollTheDice() {
    // (setState).nextint;
    setState(() {
      index1 = random.nextInt(6);
      index2 = random.nextInt(6);
      diceSum = index1 + index2 + 2;
      sum = sum + diceSum;
      if (diceSum == 7) {
        isOver = true;
      } else {
        score += index1 + index2 + 2;
      }
    });
  }
}
