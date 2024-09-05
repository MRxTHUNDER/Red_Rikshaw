//to create a splash screen for the weather app
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:red_rikshaw/Screens/WalkthroughScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WalkthroughScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: Center(
        child: Image.asset('assets/images/redlogoRemovebg.png'),
      ),
    );
  }
}