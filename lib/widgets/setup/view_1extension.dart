import 'package:flutter/material.dart';
import 'Card_view1.dart';
import 'progress_page.dart';

class GuidedPracticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/nature.png',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Abundance Guided Practice',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            SizedBox(width: 4),
                            Text('4.5'),
                            SizedBox(width: 8),
                            Text('Scott & Shanice',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        SizedBox(height: 24),
                        Text(
                          '30 mins, Intermediate',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            Icon(Icons.music_note, size: 20),
                            SizedBox(width: 8),
                            Text('Voice aloud', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          child: Text('Show Progress ...'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF5C6BC0),
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProgressPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            Row(
              children: [
                IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
                IconButton(icon: Icon(Icons.share), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
