import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxFit,
        BuildContext,
        Colors,
        Column,
        CrossAxisAlignment,
        EdgeInsets,
        ElevatedButton,
        Expanded,
        FontWeight,
        Icon,
        IconButton,
        IconData,
        Icons,
        Image,
        MainAxisAlignment,
        MaterialPageRoute,
        Navigator,
        Padding,
        RoundedRectangleBorder,
        Row,
        SafeArea,
        Scaffold,
        SingleChildScrollView,
        Size,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
// ignore: unused_import
import 'view_1extension.dart';
import '../../main.dart';

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
                    'assets/nature.jpg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Abundance Guided Practice',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            SizedBox(width: 4),
                            Text('4.5'),
                            SizedBox(width: 8),
                            Text('Scott & Shanice',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _buildInfoRow(
                            Icons.access_time, '30 mins, Intermediate'),
                        _buildInfoRow(
                            Icons.spa, 'Meditation, Breathing, sleep'),
                        _buildInfoRow(Icons.calendar_today, '10 Days'),
                        _buildInfoRow(Icons.music_note, 'Ambient'),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          child: const Text('START'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),

                          /// Navigates to the GuidedPracticePage when the button is pressed.
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const viewcardPage()),
                          ),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.bookmark_border), onPressed: () {}),
                IconButton(icon: const Icon(Icons.share), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
