// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/create_account_screen.dart';
import 'package:flutter_application_1/widgets/home_page.dart';
import 'dart:async';
import 'auth_service.dart';
import '../main.dart';
import 'setup/gender.dart';
import 'help_selection_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind Wave',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
    // Remove the extra closing parenthesis
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();

    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: Duration(milliseconds: 500),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/Home-logob.png', width: 100, height: 100),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Align horizontally
                children: [
                  Text(
                    'MIND',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ),
                  ),
                  Text(
                    ' Wave',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 48),
                Image.asset('assets/App-logob.png', width: 50, height: 50),
                SizedBox(height: 24),
                Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Sign in to a Healthier,\nHappier You',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 48),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'EMAIL',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'PASSWORD',
                    suffixIcon: Icon(Icons.visibility_off),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text('FORGET PASSWORD?'),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 2, 57, 153),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final isSignedIn =
                        await authService.signIn(email, password);
                    if (isSignedIn) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      // Show an error message or handle the case when sign-in fails
                    }
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  child: Text('SIGN UP'),
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final isSignedUp =
                        await authService.signUp(email, password);
                    if (isSignedUp) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    } else {
                      Text('Wrong password or SIGN UP');
                      Fluttertoast.showToast(
                        msg: "Wrong password redirecting to SIGN UP",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                        );
                      Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseGenderScreen()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final authService = AuthService();