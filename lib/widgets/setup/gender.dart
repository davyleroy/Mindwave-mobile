import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/setup/next_button.dart';

class ChooseGenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindwave'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Choose your gender', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenderCard('Male', Icons.male),
              SizedBox(width: 20),
              GenderCard('Female', Icons.female),
            ],
          ),
          SizedBox(height: 40),
          NextButton(),
        ],
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final String label;
  final IconData icon;

  GenderCard(this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle selection
      },
      child: Card(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 50, color: Colors.white),
              SizedBox(height: 10),
              Text(label, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
