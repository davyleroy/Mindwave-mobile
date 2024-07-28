import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle navigation
      },
      child: Icon(Icons.arrow_forward),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
    );
  }
}