import 'package:flutter/material.dart';
import 'package:Xcentrics/widgets/centered_view/centered_view.dart';
import 'package:Xcentrics/widgets/navagation_Bar/navagation_bar.dart';
import 'package:url_launcher/url_launcher.dart';

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
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    TextButton(onPressed: launchDiscordInvite, child: const Text('Join our Discord', style: TextStyle(fontSize: 24, color: Colors.blue)),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> launchDiscordInvite() async{
    final Uri uri = Uri.parse('https://discord.gg/cHaa76sK3Y'); // Replace with your actual invite link
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }
}
