import 'package:flutter/material.dart';
import 'package:koi/home/presentation/pages/home_screen.dart';

void main() {
  runApp(const Umdf());
}

class Umdf extends StatelessWidget {
  const Umdf({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

