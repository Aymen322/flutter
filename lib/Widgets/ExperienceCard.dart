import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  final String title;
  final String duration;
  final String description;
  final String imagePath;

  const ExperienceCard({
    Key? key,
    required this.title,
    required this.duration,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Align children in the center vertically
          children: [
            // Image on the left
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(
                imagePath,
                width: 150, // Adjust image width as needed
                height: 100, // Adjust image height as needed
                fit: BoxFit.cover,
              ),
            ),
            // Text on the right
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color.fromRGBO(156, 39, 176, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    duration,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
