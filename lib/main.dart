import 'package:flutter/material.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/splashScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Red Rikshaw',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.redAccent,
          ),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}
