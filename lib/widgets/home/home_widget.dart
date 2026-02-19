import 'package:flutter/material.dart';

class About_home extends StatelessWidget {
  const About_home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 600,
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/images/team_photo.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 400,
                        color: Colors.grey[800],
                        child: const Center(
                          child: Icon(Icons.image_not_supported, color: Colors.white, size: 50),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Team 5143 is a FIRST Tech Challenge team based in the United States. We are a group of passionate students who work together to design, build, and program robots to compete in the annual FIRST Tech Challenge competition. Our team is dedicated to fostering a love for STEM (Science, Technology, Engineering, and Mathematics) and promoting teamwork, creativity, and problem-solving skills among our members. We participate in various events and competitions throughout the year, where we showcase our innovative robot designs and compete against other teams from around the world. Our team is committed to inspiring the next generation of engineers and scientists through our involvement in the FIRST Tech Challenge program.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/team_photo.png',
                  width: constraints.maxWidth * 0.9,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[800],
                      child: const Center(
                        child: Icon(Icons.image_not_supported, color: Colors.white, size: 50),
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Team 5143 is a FIRST Tech Challenge team based in the United States. We are a group of passionate students who work together to design, build, and program robots to compete in the annual FIRST Tech Challenge competition. Our team is dedicated to fostering a love for STEM (Science, Technology, Engineering, and Mathematics) and promoting teamwork, creativity, and problem-solving skills among our members. We participate in various events and competitions throughout the year, where we showcase our innovative robot designs and compete against other teams from around the world. Our team is committed to inspiring the next generation of engineers and scientists through our involvement in the FIRST Tech Challenge program.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}