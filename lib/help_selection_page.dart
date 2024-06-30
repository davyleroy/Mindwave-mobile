import 'package:flutter/material.dart';

class HelpSelectionPage extends StatefulWidget {
  @override
  _HelpSelectionPageState createState() => _HelpSelectionPageState();
}

class _HelpSelectionPageState extends State<HelpSelectionPage> {
  String? selectedOption;

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
            Image.asset('assets/mindwave_logo.png',
                height: 24), // Replace with your logo
            SizedBox(width: 8),
            Text('Mindwave', style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildOption('Tackling\nStress', '😓', Colors.grey[200]!),
                      SizedBox(width: 20),
                      _buildOption(
                          'Overcoming\nDepression', '😫', Color(0xFF4A5AAB)),
                      SizedBox(width: 20),
                      _buildOption('Better\nSleep', '😴', Colors.grey[200]!),
                    ],
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
                      ? () => Navigator.pushNamed(context, '/next_page')
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Color(0xFF4A5AAB),
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 20, height: 4, color: Colors.grey[300]),
                    SizedBox(width: 4),
                    Container(width: 20, height: 4, color: Color(0xFF4A5AAB)),
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

  Widget _buildOption(String text, String emoji, Color color) {
    bool isSelected = selectedOption == text;
    return GestureDetector(
      onTap: () => setState(() => selectedOption = text),
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF4A5AAB) : color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: TextStyle(fontSize: 40)),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
