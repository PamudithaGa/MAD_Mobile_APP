import 'package:flutter/material.dart';
import 'home.dart';
import 'vendors.dart';
import 'cart.dart';
import 'profile.dart';
import 'login.dart';
import 'wedding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photographer App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueAccent,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFFA500),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1E2A5E),
          selectedItemColor: Color(0xFFFFA500),
          unselectedItemColor: Colors.grey,
        ),
      ),

      themeMode: _themeMode,
      initialRoute: Login.id,
      routes: {
        Login.id: (context) => const Login(),
        Home.id: (context) => Home(toggleTheme: _toggleTheme),
        Vendors.id: (context) => const Vendors(),
        Cart.id: (context) => const Cart(),
        Profile.id: (context) => const Profile(),
        Wedding.id: (context) => const Wedding(),
      },
    );
  }
}
