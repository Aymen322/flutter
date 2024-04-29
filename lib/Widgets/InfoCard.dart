import 'package:flutter/material.dart';


class InfoCard extends StatelessWidget {
  final String text;
  final String value;
  final Function()? onTap;
  final bool
      showClickMessage; // New parameter to control the message visibility

  const InfoCard({
    required this.text,
    required this.value,
    this.onTap,
    this.showClickMessage = false, // Default value is false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(); // Call onTap if it's defined
        }
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value),
                if (showClickMessage) // Conditionally show the message
                  SizedBox(height: 4),
                if (showClickMessage) // Conditionally show the message
                  Text(
                    "Click to view",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}