import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:koi/home/presentation/pages/home_screen.dart';

import 'bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
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

