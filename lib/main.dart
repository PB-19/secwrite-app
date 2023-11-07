import 'package:flutter/material.dart';
import 'package:secwriteapp/src/pages/login_screen.dart';
import 'package:secwriteapp/src/pages/register_screen.dart';
import 'package:secwriteapp/src/pages/welcome.dart';
import 'src/utils/themes/main_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      themeMode: ThemeMode.system,
      routes: {
        '/login/':(context) => const LoginScreen(),
        '/register/':(context) => const RegisterScreen(),
      },
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}