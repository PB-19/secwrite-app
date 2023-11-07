import 'package:flutter/material.dart';
import 'package:secwriteapp/src/utils/constants/strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(welcomeImage),
            Column(
              children: [
                Text(
                  "Welcome to SecWrite!",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                Text(
                  "Your private note-keeping app!",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text("LOGIN"),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("REGISTER"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}