import 'package:flutter/material.dart';
import 'package:secwriteapp/src/utils/constants/strings.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(welcomeImage),
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back!",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0,),
            const Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                ),
                SizedBox(height: 10.0,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: UnderlineInputBorder(),
                  ),
                  obscureText: true,
                  autocorrect: false,
                ),
                SizedBox(height: 10.0,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    border: UnderlineInputBorder(),
                  ),
                  obscureText: true,
                  autocorrect: false,
                ),
              ],
            ),
            const SizedBox(height: 20.0,),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          
                        },
                        child: const Text("LOGIN"),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register/');
                  },
                  child: const Text("Don't have an account? Register here!"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
