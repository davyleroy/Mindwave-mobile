// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/widgets/setup/sleep_screen.dart';

class HelpSelectionScreen extends StatefulWidget {
  @override
  _HelpSelectionScreenState createState() => _HelpSelectionScreenState();
}

class _HelpSelectionScreenState extends State<HelpSelectionScreen> {
  final List<String> helpOptions = ['Overcoming Depression', 'Reducing Stress', 'Better Sleep'];
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Home-logob.png', height: 24), // Replace with your logo
            SizedBox(width: 8),
            Text('Mindwave', style: TextStyle(color: Colors.black)),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'What can we\nhelp you with',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 150,
                      enlargeCenterPage: true,
                      autoPlay: false,
                    ),
                    items: helpOptions.map((option) {
                      return Builder(
                        builder: (BuildContext context) {
                          bool isSelected = selectedOption == option;
                          return GestureDetector(
                            onTap: () => setState(() => selectedOption = option),
                            child: Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                color: isSelected ?  Color.fromARGB(255, 2, 57, 153) : Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                ElevatedButton(
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: selectedOption != null
                      ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SleepHoursScreen(),
                          ),
                        )
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Color.fromARGB(255, 2, 57, 153),
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 20, height: 4, color: Colors.grey[300]),
                    SizedBox(width: 4),
                    Container(width: 20, height: 4, color: Color.fromARGB(255, 2, 57, 153)),
                    SizedBox(width: 4),
                    Container(width: 20, height: 4, color: Colors.grey[300]),
                    SizedBox(width: 4),
                    Container(width: 20, height: 4, color: Colors.grey[300]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
