import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.cardchild, this.onPress});

  final Color colour; final cardchild; final onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}