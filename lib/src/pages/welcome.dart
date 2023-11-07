import 'package:flutter/material.dart';
import 'package:secwriteapp/src/utils/constants/strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(welcomeImage)),
          ],
        ),
      ),
    );
  }
}