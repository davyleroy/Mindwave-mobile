import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/setup/feeling_screen.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Home-logob.png', height: 24), // Replace with your logo
            SizedBox(width: 8),
            Text('Mindwave', style: TextStyle(color: Colors.black)),
          ],
        ),
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
            min: 0,
            max: 24,
            divisions: 24,
            label: _sleepHours.round().toString(),
            onChanged: (double value) {
              setState(() {
                _sleepHours = value;
              });
            },
          ),
          Text('${_sleepHours.round()} hours', style: TextStyle(fontSize: 18)),
          SizedBox(height: 40),
         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeelingScreen(),
                  ),
                );
              },
            child: Icon(Icons.arrow_forward),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
            ),
          ),
          SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 20, height: 4, color: Colors.grey[300]),
                    SizedBox(width: 4),
                    Container(width: 20, height: 4, color:Colors.grey[300] ),
                    SizedBox(width: 4),
                    Container(width: 20, height: 4, color: Color.fromARGB(255, 2, 57, 153)),
                    SizedBox(width: 4),
                    Container(width: 20, height: 4, color: Colors.grey[300]),
                  ],
            ),
        ],
      ),
    );
  }
}
