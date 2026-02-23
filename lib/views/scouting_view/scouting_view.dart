import 'package:flutter/material.dart';
import 'package:Xcentrics/widgets/centered_view/centered_view.dart';
import 'package:Xcentrics/widgets/navagation_Bar/navagation_bar.dart';
import 'package:Xcentrics/widgets/scouting/scouting_widget.dart';

class ScoutingView extends StatelessWidget {
  const ScoutingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CenteredView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: NavagationBar(),
            ),
            Expanded(
              child: ScoutingWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
