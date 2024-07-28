import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/setup/next_button.dart';

class FeelingScreen extends StatelessWidget {
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
          Text('How are you feeling?', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FeelingEmoji('Happy', Icons.sentiment_very_satisfied),
              SizedBox(width: 20),
              FeelingEmoji('Neutral', Icons.sentiment_neutral),
              SizedBox(width: 20),
              FeelingEmoji('Sad', Icons.sentiment_dissatisfied),
            ],
          ),
          SizedBox(height: 40),
          NextButton(),
        ],
      ),
    );
  }
}

class FeelingEmoji extends StatelessWidget {
  final String label;
  final IconData icon;

  FeelingEmoji(this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 50, color: Colors.blueAccent),
        SizedBox(height: 10),
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
