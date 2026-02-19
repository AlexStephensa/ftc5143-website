import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const largeScreenMinWidth = 935.0;

class NavagationBar extends StatefulWidget {
  const NavagationBar({super.key});

  @override
  State<NavagationBar> createState() => _NavagationBarState();
}

class _NavagationBarState extends State<NavagationBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isLargeScreen = constraints.maxWidth > largeScreenMinWidth;
          if (!isLargeScreen) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 75,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'FIRST Tech Challenge Team 5143',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                MenuAnchor(
                  builder: (context, controller, child) {
                    return IconButton(
                      onPressed: () {
                        if (controller.isOpen) {
                          controller.close();
                        } else {
                          controller.open();
                        }
                      },
                      icon: const Icon(Icons.menu, color: Colors.white),
                    );
                  },
                  menuChildren: [
                    MenuItemButton(
                      onPressed: () => context.go('/'),
                      child: const _NavBarItem('Home'),
                    ),
                    MenuItemButton(
                      onPressed: () => context.go('/scouting'),
                      child: const _NavBarItem('Scouting'),
                    ),
                    MenuItemButton(
                      onPressed: () => context.go('/about'),
                      child: const _NavBarItem('About'),
                    ),
                    MenuItemButton(
                      onPressed: () => context.go('/contact'),
                      child: const _NavBarItem('Contact'),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100 * constraints.maxHeight / 100,
                  width: 150 * constraints.maxHeight / 100,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const Text(
                  'FIRST Tech Challenge Team 5143',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () => context.go('/'),
                      child: const _NavBarItem('Home'),
                    ),
                    const SizedBox(width: 30),
                    TextButton(
                      onPressed: () => context.go('/scouting'),
                      child: const _NavBarItem('Scouting'),
                    ),
                    const SizedBox(width: 30),
                    TextButton(
                      onPressed: () => context.go('/about'),
                      child: const _NavBarItem('About'),
                    ),
                    const SizedBox(width: 30),
                    TextButton(
                      onPressed: () => context.go('/contact'),
                      child: const _NavBarItem('Contact'),
                    ),
                  ],
                ),
              ],
            );
          }
        },
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
      style: const TextStyle(fontSize: 18, color: Colors.white),
    );
  }
}

