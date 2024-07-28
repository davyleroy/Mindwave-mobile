import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/widgets/setup/next_button.dart';

class HelpSelectionScreen extends StatelessWidget {
  final List<String> helpOptions = ['Overcoming Depression', 'Reducing Stress', 'Better Sleep'];

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
          Text('What can we help you with', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          CarouselSlider(
            options: CarouselOptions(height: 150, enlargeCenterPage: true),
            items: helpOptions.map((option) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text(
                        option,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 40),
          NextButton(),
        ],
      ),
    );
  }
}
