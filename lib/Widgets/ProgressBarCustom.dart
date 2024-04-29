import 'package:flutter/material.dart';

class ProgressBarCustom extends StatelessWidget {
  final String skill;
  final int percentage;

  const ProgressBarCustom({
    Key? key,
    required this.skill,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColorFromPercentage(int percentage) {
      if (percentage >= 90) {
        return Colors.green;
      } else if (percentage >= 70) {
        return Colors.yellow;
      } else {
        return Colors.red;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          skill,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10.0),
        LinearProgressIndicator(
          backgroundColor: Colors.grey[700],
          value: percentage / 100,
          valueColor: AlwaysStoppedAnimation<Color>(
            getColorFromPercentage(percentage),
          ),
        ),
      ],
    );
  }
}
