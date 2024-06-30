import 'package:flutter/material.dart';

class GenderSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.psychology, color: Colors.black), // Placeholder for logo
            SizedBox(width: 8),
            Text('Mindwave', style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose your\ngender',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildGenderOption('Male', '👨', Color(0xFF4A5AAB)),
                      SizedBox(width: 20),
                      _buildGenderOption('Female', '👩', Colors.grey[200]!),
                    ],
                  ),
                ],
              ),
            ),
            _buildNextButton(),
            SizedBox(height: 20),
            _buildProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderOption(String gender, String emoji, Color color) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: TextStyle(fontSize: 50)),
          SizedBox(height: 10),
          Text(
            gender,
            style: TextStyle(
              color: gender == 'Male' ? Colors.white : Colors.black,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      child: Icon(Icons.arrow_forward, color: Colors.white),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.black,
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 20, height: 4, color: Color(0xFF4A5AAB)),
        SizedBox(width: 4),
        Container(width: 20, height: 4, color: Colors.grey[300]),
        SizedBox(width: 4),
        Container(width: 20, height: 4, color: Colors.grey[300]),
        SizedBox(width: 4),
        Container(width: 20, height: 4, color: Colors.grey[300]),
      ],
    );
  }
}
