
import 'package:go_router/go_router.dart';
import 'package:myapp/views/about/about_view.dart';
import 'package:myapp/views/contact/contact_view.dart';
import 'package:myapp/views/home/home_view.dart';
import 'package:myapp/views/scouting_view/scouting_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutView(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactView(),
    ),
    GoRoute(
      path: '/scouting',
      builder: (context,state) => const ScoutingView(),
    )
  ],
);
