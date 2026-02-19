
import 'package:go_router/go_router.dart';
import 'package:myapp/views/about/about_view.dart';
import 'package:myapp/views/contact/contact_view.dart';
import 'package:myapp/views/home/home_view.dart';
import 'package:myapp/views/scouting_view/scouting_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) =>  AboutView(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) =>  ContactView(),
    ),
    GoRoute(
      path: '/scouting',
      builder: (context,state) =>  ScoutingView(),
    )
  ],
);
