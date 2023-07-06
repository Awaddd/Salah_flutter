import 'package:flutter/material.dart';
import 'package:salah_app/core/templates/template.dart';
import 'package:salah_app/core/utils/color_schemes.g.dart';
import 'package:salah_app/features/home/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Starter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const AppTemplate(child: Home()),
    );
  }
}
