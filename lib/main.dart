import 'package:flutter/material.dart';
import 'package:xcentrics/router.dart';
import 'package:xcentrics/services/appwrite_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppwriteService.instance.init();
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF121212)),
      ),
      routerConfig: router,
    );
  }
}