import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class NavagationBar extends StatelessWidget {
  const NavagationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 80,
            width: 150,
            child: Image.asset('assets/images/logo.png'),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _NavBarItem('About'),
              SizedBox(
                width: 60,
              ),
              _NavBarItem('Contact'),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        _CurrentPage.state = 1;
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 18, color: Colors.white),
      )
      },
    );
  }
}
