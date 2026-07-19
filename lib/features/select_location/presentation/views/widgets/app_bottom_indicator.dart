import 'package:flutter/material.dart';

class AppBottomIndicator extends StatelessWidget {
  final double opacity; 

  const AppBottomIndicator({super.key, this.opacity = 0.6});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(opacity),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}