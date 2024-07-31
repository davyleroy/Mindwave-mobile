import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/setup/help_screen.dart';


class ChooseGenderScreen extends StatefulWidget {
  @override
  _ChooseGenderScreenState createState() => _ChooseGenderScreenState();
}

class _ChooseGenderScreenState extends State<ChooseGenderScreen> {
  String? _selectedGender;

  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Mindwave',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose your gender',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenderCard(
                  label: 'Male',
                  imageAsset: 'assets/male.png', // Update with your asset path
                  isSelected: _selectedGender == 'Male',
                  onTap: () => _selectGender('Male'),
                ),
                SizedBox(width: 20),
                GenderCard(
                  label: 'Female',
                  imageAsset: 'assets/female.png', // Update with your asset path
                  isSelected: _selectedGender == 'Female',
                  onTap: () => _selectGender('Female'),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpSelectionScreen(),
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
                Container(
                  width: 50,
                  height: 5,
                  color: Colors.blue,
                ),
                SizedBox(width: 5),
                Container(
                  width: 50,
                  height: 5,
                  color: Colors.grey[300],
                ),
                SizedBox(width: 5),
                Container(
                  width: 50,
                  height: 5,
                  color: Colors.grey[300],
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final String label;
  final String imageAsset;
  final bool isSelected;
  final VoidCallback onTap;

  GenderCard({
    required this.label,
    required this.imageAsset,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 150,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              width: 50,
              height: 50,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}