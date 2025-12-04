import 'package:flutter/material.dart';

class GradientCustom extends StatelessWidget {
  final Widget child;
  const GradientCustom({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 52, 3, 98),
            Color.fromARGB(255, 154, 53, 255),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
