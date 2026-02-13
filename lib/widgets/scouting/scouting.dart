import 'package:flutter/material.dart';

class Scouting extends StatelessWidget {
  const Scouting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/team_photo.png'), height: 650,),
          Padding(padding: EdgeInsetsGeometry.all(20),
          child: SizedBox(
            width: 1100,
            child: Text('Team 5143 is a FIRST Tech Challenge team based in the United States. We are a group of passionate students who work together to design, build, and program robots to compete in the annual FIRST Tech Challenge competition. Our team is dedicated to fostering a love for STEM (Science, Technology, Engineering, and Mathematics) and promoting teamwork, creativity, and problem-solving skills among our members. We participate in various events and competitions throughout the year, where we showcase our innovative robot designs and compete against other teams from around the world. Our team is committed to inspiring the next generation of engineers and scientists through our involvement in the FIRST Tech Challenge program.',
            style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
    )
        ],
      );
  }
}
