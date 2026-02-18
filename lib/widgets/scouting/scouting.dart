import 'package:flutter/material.dart';

class Scouting extends StatelessWidget {
  const Scouting({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.5,
                child: Image(
                  image: AssetImage('assets/images/team_photo.png'),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.4,
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Team 5143 is a FIRST Tech Challenge team based in the United States. We are a group of passionate students who work together to design, build, and program robots to compete in the annual FIRST Tech Challenge competition. Our team is dedicated to fostering a love for STEM (Science, Technology, Engineering, and Mathematics) and promoting teamwork, creativity, and problem-solving skills among our members. We participate in various events and competitions throughout the year, where we showcase our innovative robot designs and compete against other teams from around the world. Our team is committed to inspiring the next generation of engineers and scientists through our involvement in the FIRST Tech Challenge program.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/team_photo.png'),
                width: constraints.maxWidth * 0.9,
                fit: BoxFit.contain,
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Team 5143 is a FIRST Tech Challenge team based in the United States. We are a group of passionate students who work together to design, build, and program robots to compete in the annual FIRST Tech Challenge competition. Our team is dedicated to fostering a love for STEM (Science, Technology, Engineering, and Mathematics) and promoting teamwork, creativity, and problem-solving skills among our members. We participate in various events and competitions throughout the year, where we showcase our innovative robot designs and compete against other teams from around the world. Our team is committed to inspiring the next generation of engineers and scientists through our involvement in the FIRST Tech Challenge program.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          );
        }
      },
    );
  }
}