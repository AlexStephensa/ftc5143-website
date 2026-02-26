
import 'package:go_router/go_router.dart';
import 'package:xcentrics/views/about/about_view.dart';
import 'package:xcentrics/views/contact/contact_view.dart';
import 'package:xcentrics/views/home/home_view.dart';
import 'package:xcentrics/views/scouting_view/scouting_view.dart';
import 'package:xcentrics/views/scouting_home_view.dart';
import 'package:xcentrics/views/match_scouting_view/match_scouting_view.dart';
import 'package:xcentrics/views/pit_scouting_view/pit_scouting_view.dart';

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
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const ScoutingHomeView(),
    ),
    GoRoute(
      path: '/match-scouting',
      builder: (context, state) => const MatchScoutingView(),
    ),
    GoRoute(
      path: '/pit-scouting',
      builder: (context, state) => const PitScoutingView(),
    ),
  ],
);
