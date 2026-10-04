// Lokasi: lib/main.dart
import 'package:flutter/material.dart';
import 'login_page.dart'; // Memanggil halaman login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nayraa Shop',
      debugShowCheckedModeBanner: false, // Menghilangkan tulisan DEBUG di pojok
      theme: ThemeData(
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      // INI KUNCINYA: Aplikasi akan mulai dari LoginPage
      home: const LoginPage(), 
    );
  }
}