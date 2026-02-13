import 'package:flutter/material.dart';

class Scouting extends StatelessWidget {
  const Scouting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Scouting',
            style: TextStyle(fontWeight: FontWeight.w800, height: 0.9,color: Colors.white),
          ),
          SizedBox(height: 50,),
          Text('Auto', style: TextStyle(fontWeight: FontWeight.w800, height: 0.9, color: Colors.white),),
          SizedBox(height: 20),
          Text('PUT AUTO STUFF HERE', style: TextStyle(fontWeight: FontWeight.w800, height: 0.9, color: Colors.white,)),
        ],
      ),
    );
  }
}
