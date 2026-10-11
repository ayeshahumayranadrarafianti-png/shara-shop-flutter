import 'package:flutter/material.dart'; 
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sharaa Outfit Store',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      
      home: const SplashScreen(), 
    );
  }
}