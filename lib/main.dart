import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/help_selection_page.dart';
import 'widgets/auth_service.dart';
import 'widgets/splash_screen.dart';
import 'widgets/setup/gender.dart';
import 'widgets/setup/sleep_screen.dart';
import 'widgets/setup/feeling_screen.dart';
import 'widgets/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/choose_gender': (context) => ChooseGenderScreen(),
        '/help': (context) => HelpSelectionPage(),
        '/sleep_hours': (context) => SleepHoursScreen(),
        '/feeling': (context) => FeelingScreen(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
