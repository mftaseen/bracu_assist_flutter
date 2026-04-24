import 'package:flutter/material.dart';
import 'pages/start_page.dart';
import 'pages/new_user_page.dart';
import 'pages/profile_page.dart';
import 'pages/menu_page.dart';
import 'pages/notifications_page.dart';
import 'pages/schedule_page.dart';
import 'pages/advising_page.dart';
import 'pages/all_events_page.dart';
import 'pages/upcoming_events_page.dart';
import 'pages/past_events_page.dart';
import 'pages/event_details_page.dart';

void main() {
  runApp(const BracuAssistApp());
}

class BracuAssistApp extends StatelessWidget {
  const BracuAssistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BRACU ASSIST',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'GoogleSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'JockeyOne',
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/start',
      routes: {
        '/start': (context) => const StartPage(),
        '/new_user': (context) => const NewUserPage(),
        '/profile': (context) => const ProfilePage(),
        '/menu': (context) => const MenuPage(),
        '/notifications': (context) => const NotificationsPage(),
        '/schedule': (context) => const SchedulePage(),
        '/advising': (context) => const AdvisingPage(),
        '/all_events': (context) => const AllEventsPage(),
        '/upcoming_events': (context) => const UpcomingEventsPage(),
        '/past_events': (context) => const PastEventsPage(),
        '/event_details': (context) => const EventDetailsPage(),
      },
    );
  }
}
