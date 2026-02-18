import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavagationBar extends StatelessWidget {
  const NavagationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: LayoutBuilder(
        builder: (context,constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 100 * constraints.maxHeight / 100,
                width: 150,
                child: Image.asset('assets/images/logo.png'),
              ),
              Text(
                'FIRST Tech Challenge Team 5143',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: () => context.go('/'), 
                      child: _NavBarItem('Home')),
                  SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: () => context.go('/scouting'),
                    child: _NavBarItem('Scouting'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: () => context.go('/about'),
                    child: _NavBarItem('About'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: () => context.go('/contact'),
                    child: _NavBarItem('Contact'),
                  ),
                ],
              ),
            ],
          );
        }
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, color: Colors.white),
    );
  }
}
