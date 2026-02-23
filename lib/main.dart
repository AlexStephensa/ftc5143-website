import 'package:flutter/material.dart';
import 'package:Xcentrics/router.dart';

void main() {
  runApp(const Xcentrics());
}

class Xcentrics extends StatelessWidget {
  const Xcentrics({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FTC Team 5143',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      routerConfig: router,
    );
  }
}
