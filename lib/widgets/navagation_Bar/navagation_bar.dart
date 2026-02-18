import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const largeScreenMinWidth = 935.0;

class NavagationBar extends StatefulWidget {
  const NavagationBar({super.key});

  @override
  State<NavagationBar> createState() => _NavagationBarState();
}

//TODO: make navbar menu work
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
                Builder(
                  builder: (buttonContext) {
                    return IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () async {
                        final button =
                            buttonContext.findRenderObject() as RenderBox;
                        final overlay =
                            Overlay.of(buttonContext).context.findRenderObject()
                                as RenderBox;
                        final selectedRoute = await showMenu<String>(
                          context: buttonContext,
                          position: RelativeRect.fromRect(
                            Rect.fromPoints(
                              button.localToGlobal(
                                Offset.zero,
                                ancestor: overlay,
                              ),
                              button.localToGlobal(
                                button.size.bottomRight(Offset.zero),
                                ancestor: overlay,
                              ),
                            ),
                            Offset.zero & overlay.size,
                          ),
                          items: const [
                            PopupMenuItem<String>(
                              value: '/',
                              child: _NavBarItem('Home'),
                            ),
                            PopupMenuItem<String>(
                              value: '/scouting',
                              child: _NavBarItem('Scouting'),
                            ),
                            PopupMenuItem<String>(
                              value: '/about',
                              child: _NavBarItem('About'),
                            ),
                            PopupMenuItem<String>(
                              value: '/contact',
                              child: _NavBarItem('Contact'),
                            ),
                          ],
                        );

                        if (!buttonContext.mounted || selectedRoute == null) {
                          return;
                        }

                        buttonContext.go(selectedRoute);
                      },
                    );
                  },
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
                Text(
                  'FIRST Tech Challenge Team 5143',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () => context.go('/'),
                      child: _NavBarItem('Home'),
                    ),
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
      style: TextStyle(fontSize: 18, color: Colors.white),
    );
  }
}
