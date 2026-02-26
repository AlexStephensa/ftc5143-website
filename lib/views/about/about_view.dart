import 'package:flutter/material.dart';
import 'package:xcentrics/widgets/centered_view/centered_view.dart';
import 'package:xcentrics/widgets/navagation_Bar/navagation_bar.dart';


class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: CenteredView(
        child: Column(
          children: [
            NavagationBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'About Us',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      'assets/images/meat_the_team.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 300,
                          color: Colors.grey[800],
                          child: const Center(
                            child: Icon(Icons.image_not_supported, color: Colors.white, size: 50),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
