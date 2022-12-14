import 'package:finger_print_authentication/finger_print_authentication/finger_print_authentication.dart';
import 'package:finger_print_authentication/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  @override
  void initState() {
    Authenticate();
    super.initState();
  }

  Future<void> Authenticate() async {
    final isAuthenticated = await FingerPrintAuthentication.authenticate();

    if (isAuthenticated) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => SplashScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
