import 'package:flutter/material.dart';

extension Tint on Color {
  Color lighten({required double amount}) {
    final newRed = red + (255 - red) * amount;
    final newGreen = green + (255 - green) * amount;
    final newBlue = blue + (255 - blue) * amount;
    return Color.fromARGB(
        alpha, newRed.round(), newGreen.round(), newBlue.round());
  }
}
