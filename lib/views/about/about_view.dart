import 'package:flutter/material.dart';


class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
        children: [
          Text(
          'About Us',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
          ]
    )
      ),
    );
  }
}
