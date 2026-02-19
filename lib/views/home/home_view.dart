import 'package:flutter/material.dart';
import 'package:myapp/widgets/centered_view/centered_view.dart';
import 'package:myapp/widgets/home/home_widget.dart';
import 'package:myapp/widgets/navagation_Bar/navagation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CenteredView(
        child: Column(
          children: [
            NavagationBar(),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: About_home()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
