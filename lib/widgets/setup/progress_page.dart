import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Streaks🔥', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildProgressSection(),
          SizedBox(height: 20),
          _buildDayItem(
              'DAY 01', 'All you do is breathe', '20 min', 'assets/leaves.jpg'),
          _buildDayItem(
              'DAY 02', 'Here and now', '29 min', 'assets/sunset.jpg'),
          _buildDayItem(
              'DAY 03', 'Witness your thoughts', '25 min', 'assets/bulb.jpg'),
          _buildDayItem(
              'DAY 04', 'Mind-body connection', '19 min', 'assets/plant.jpg'),
          _buildDayItem('DAY 05', '', '', 'assets/sky.jpg'),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '5 Days',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('of the course\nplan completed',
                      style: TextStyle(color: Colors.grey)),
                  Text('Keep it up!',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: List.generate(6, (index) {
            return Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 2),
                height: 40,
                decoration: BoxDecoration(
                  color: index < 5 ? Colors.indigo : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: index < 5
                    ? Icon(Icons.check, color: Colors.white)
                    : Center(
                        child:
                            Text('6', style: TextStyle(color: Colors.black))),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildDayItem(
      String day, String title, String duration, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(day, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(duration, style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
