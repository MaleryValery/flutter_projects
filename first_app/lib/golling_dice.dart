import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class RollingDice extends StatefulWidget {
  const RollingDice({super.key});

  @override
  State<RollingDice> createState() {
    return _RollingDiceState();
  }
}

class _RollingDiceState extends State<RollingDice> {
  var currentDiceRoll = 2;

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: const TextStyle(fontSize: 28)),
          child: const Text('Roll dice'),
        ),
      ],
    );
  }
}
