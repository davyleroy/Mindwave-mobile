import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed; 

  NextButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Icon(Icons.arrow_forward),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
