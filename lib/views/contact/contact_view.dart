import 'package:flutter/material.dart';
import 'package:myapp/widgets/centered_view/centered_view.dart';
import 'package:myapp/widgets/navagation_Bar/navagation_bar.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: CenteredView(
        child: Column(
          children: [
            NavagationBar(),

            Center(

              child:Column( 
                children: [
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Email: robotics5143@crxcs.org',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Discord: (INSERT DISCORD LINK)',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
              ]
              )
            ),
          ],
        ),
      ),
    );
  }
}
