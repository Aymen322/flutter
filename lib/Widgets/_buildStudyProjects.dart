import 'package:flutter/material.dart';

class ProjectItem extends StatelessWidget {
  final String title;
  final String description;
  final List<String> skills;

  const ProjectItem({
    Key? key,
    required this.title,
    required this.description,
    required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.purple, // Couleur du texte en violet
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          description,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black, // Couleur du texte en violet
          ),
        ),
        SizedBox(height: 8.0),
        Wrap(
          spacing: 8.0,
          children: skills.map((skill) {
            IconData iconData = Icons.code; // Définissez l'icône selon la compétence
            String label = skill; // Définissez le texte du jeton
            return Chip(
              avatar: Icon(
                iconData,
                color: Colors.purple, // Couleur de l'icône en violet
              ), // Icône du jeton
              label: Text(
                label,
                style: TextStyle(
                  color: Colors.purple, // Couleur du texte en violet
                ),
              ), // Texte du jeton
            );
          }).toList(),
        ),
      ],
    );
  }
}
