import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/setup/gender.dart';
import 'package:flutter_application_1/widgets/splash_screen.dart';

// import 'auth_service.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                  'Create Account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Join MindWave: Your First Step to Inner Peace',
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
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'CONFIRM PASSWORD',
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                )
              ),
                SizedBox(height: 24),
                ElevatedButton(
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 2, 57, 153),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final isSignedUp = await authService.signUp(email, password);
                    if (isSignedUp) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ChooseGenderScreen()),
                      );
                    } else {
                      
                    }
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  child: Text('SIGN IN WITH PHONE NUMBER'),
                  onPressed: () {
                   
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.grey[300],
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Have an account already? "),
                    TextButton(
                      child: Text('Log in'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
