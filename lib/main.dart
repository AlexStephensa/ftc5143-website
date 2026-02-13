import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:myapp/views/home/home_view.dart';
import 'package:myapp/views/scouting_view/scouting_view.dart';
import 'package:myapp/widgets/scouting/scouting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: _CurrentPage(),
    );
  }
}

class _CurrentPage extends StatefulWidget {
  const _CurrentPage({super.key});
  static var state = 0;

  @override
  State<_CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<_CurrentPage> {
  @override
  Widget build(BuildContext context) {
    switch (_CurrentPage.state) {
      case 0:
        return HomeView();
      case 1:
        return ScoutingView();
      default:
      return HomeView();
    }
  }
}
