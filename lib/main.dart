import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secwriteapp/firebase_options.dart';
import 'package:secwriteapp/src/pages/home_screen.dart';
import 'package:secwriteapp/src/pages/login_screen.dart';
import 'package:secwriteapp/src/pages/register_screen.dart';
import 'package:secwriteapp/src/pages/welcome.dart';
import 'src/pages/verify_email_screen.dart';
import 'src/utils/themes/main_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        '/main/': (context) => const Homepage(),
        '/home/': (context) => const HomeScreen(),
        '/login/': (context) => const LoginScreen(),
        '/register/': (context) => const RegisterScreen(),
      },
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                print(user);
                return const HomeScreen();
              } else {
                return const VerifyEmailScreen();
              }
            } else {
              return const WelcomeScreen();
            }
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
