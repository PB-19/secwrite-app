import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secwriteapp/firebase_options.dart';
import 'package:secwriteapp/src/utils/constants/strings.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            // TODO: Handle this case.
            case ConnectionState.waiting:
            // TODO: Handle this case.
            case ConnectionState.active:
            // TODO: Handle this case.
            case ConnectionState.done:
              return Container(
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
                          "Hello there! 👋",
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
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: _confirmController,
                          decoration: const InputDecoration(
                            hintText: "Confirm Password",
                            border: UnderlineInputBorder(),
                          ),
                          obscureText: true,
                          enableSuggestions: false,
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
                                  final confirm = _confirmController.text;
                                  if (password == confirm) {
                                    try {
                                      final userCredentials = FirebaseAuth
                                          .instance
                                          .createUserWithEmailAndPassword(
                                        email: email,
                                        password: password,
                                      );
                                      print(userCredentials);
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'weak-password') {
                                        print("Weak password");
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        print("User already exists");
                                      } else if (e.code == 'invalid-email') {
                                        print("Invalid email");
                                      } else {
                                        print("An error occured!");
                                      }
                                    }
                                  } else {
                                    print("PASSWORDS DO NOT MATCH!!!");
                                  }
                                  Navigator.of(context).pushNamed('/login/');
                                },
                                child: const Text("REGISTER"),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login/');
                          },
                          child: const Text(
                              "Already have an account? Login here!"),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            default:
              return const Text("Loading!");
          }
        },
      ),
    );
  }
}
