import 'package:flutter/material.dart';
import 'package:learning_b/Widget/splash_screen.dart';
import 'package:learning_b/modules/auth/screens/createAccount.dart';
import 'package:learning_b/modules/auth/screens/login.dart';
import 'package:learning_b/navigation/home.dart';
import 'package:learning_b/navigation/navigation.dart';
import 'package:learning_b/navigation/profile.dart';
import 'package:learning_b/navigation/reservations.dart';
import 'package:learning_b/navigation/top.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/menu': (context) => const Navigation(),
        '/home': (context) => const home(),
        '/profile': (context) => const Profile(),
        '/reservations': (context) => const Reservations(),
        '/top': (context) => const Top(),
        '/login': (context) => const Login(),
        '/register': (context) => const CreateAccount(),
      },
    );
  }
}
