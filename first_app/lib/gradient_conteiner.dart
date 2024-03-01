import 'package:flutter/material.dart';
import 'package:first_app/golling_dice.dart';

const startGradient = Alignment.topLeft;
const endGradient = Alignment.bottomRight;

class GradientConteiner extends StatelessWidget {
  const GradientConteiner(this.myColors, {super.key});

  final List<Color> myColors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: myColors,
          begin: startGradient,
          end: endGradient,
        ),
      ),
      child: const Center(
        child: RollingDice(),
      ),
    );
  }
}
