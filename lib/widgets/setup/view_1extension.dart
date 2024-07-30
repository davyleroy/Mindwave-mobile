// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'progress_page.dart' show ProgressPage;
import 'card_view1.dart';
import 'package:flutter/services.dart';

class viewcardPage extends StatelessWidget {
  const viewcardPage({super.key});

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
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
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
                            backgroundColor: Color.fromARGB(255, 249, 250, 252),
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProgressPage(),
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
            ), //back button   //IconButton(icon: Icon(Icons.menu), onPressed: () {}),
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
