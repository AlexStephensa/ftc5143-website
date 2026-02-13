import 'package:flutter/material.dart';
import 'package:myapp/widgets/navagation_Bar/navagation_bar.dart';
import 'package:myapp/widgets/scouting/scouting.dart';
import 'package:myapp/widgets/centered_view/centered_view.dart';

class ScoutingView extends StatelessWidget {
  const ScoutingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CenteredView(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        NavagationBar(),
                        
                      ]
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
