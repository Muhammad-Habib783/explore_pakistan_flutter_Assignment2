import 'package:flutter/material.dart';

import 'shared.dart';
import 'splash_screen.dart';

void main() {
  runApp(const ExplorePakistanApp());
}

class ExplorePakistanApp extends StatelessWidget {
  const ExplorePakistanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Explore Pakistan',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
        scaffoldBackgroundColor: Colors.white, // 👈 Changed to white
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimary,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: const CardThemeData(
          surfaceTintColor: Colors.transparent,
          color: Colors.white,
          elevation: 2,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}