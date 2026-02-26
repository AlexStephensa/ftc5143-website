import 'package:flutter/material.dart';
import 'package:xcentrics/widgets/centered_view/centered_view.dart';
import 'package:xcentrics/widgets/home/home_widget.dart';
import 'package:xcentrics/widgets/navagation_Bar/navagation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
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
