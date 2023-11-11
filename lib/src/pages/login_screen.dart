import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:secwriteapp/src/utils/constants/strings.dart';
import 'dart:developer' as devtools show log;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            const Image(
              image: AssetImage(welcomeImage),
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back! 👋",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    border: UnderlineInputBorder(),
                  ),
                  obscureText: true,
                  autocorrect: false,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () async {
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          try {
                            final userCredentials = FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            devtools.log(userCredentials.toString());
                            Navigator.of(context).pushNamed('/main/');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              devtools.log("User not found");
                            } else if (e.code == 'wrong-password') {
                              devtools.log("Wrong password");
                            } else {
                              devtools.log("An error occured!");
                            }
                          }
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
                  child: const Text(
                      "Don't have an account? Register here!"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
