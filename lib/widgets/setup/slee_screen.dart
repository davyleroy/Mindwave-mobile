import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/setup/next_button.dart';

class SleepHoursScreen extends StatefulWidget {
  @override
  _SleepHoursScreenState createState() => _SleepHoursScreenState();
}

class _SleepHoursScreenState extends State<SleepHoursScreen> {
  double _sleepHours = 8;

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
          Text('How many hours do you sleep?', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Slider(
            value: _sleepHours,
            min: 6,
            max: 10,
            divisions: 4,
            label: _sleepHours.round().toString(),
            onChanged: (double value) {
              setState(() {
                _sleepHours = value;
              });
            },
          ),
          Text('${_sleepHours.round()} hours', style: TextStyle(fontSize: 18)),
          SizedBox(height: 40),
          NextButton(),
        ],
      ),
    );
  }
}
