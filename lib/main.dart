import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.purple.shade400,
          secondary: Colors.purple.shade200,
          background: Colors.white,
          surface: Colors.white,
          onBackground: Colors.grey.shade900,
          onSurface: Colors.grey.shade900,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.light().textTheme,
        ).apply(
          bodyColor: Colors.grey.shade900,
          displayColor: Colors.grey.shade900,
        ),
        scaffoldBackgroundColor: Colors.white,
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}