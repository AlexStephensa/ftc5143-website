import 'package:flutter/material.dart';
import 'package:myapp/widgets/centered_view/centered_view.dart';
import 'package:myapp/widgets/navagation_Bar/navagation_bar.dart';


class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CenteredView(
        child: Column(
        children: [
          
          NavagationBar(),
          Text(
          'About Us',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
          Image(image: AssetImage('assets/images/meat_the_team.png')),
          
          ]
    )
      ),
    );
  }
}
