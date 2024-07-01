import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;

  const GradientScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 247, 227, 203),
            Colors.white,
            Colors.white,
            Color.fromARGB(255, 247, 227, 203),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: body,
      ),
    );
  }
}
