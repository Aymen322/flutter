import 'package:flutter/material.dart';

class EducationItem extends StatelessWidget {
  final String title;
  final String duration;
  final String description;
  final String imagePath;

  const EducationItem({
    Key? key,
    required this.title,
    required this.duration,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 80, // Largeur de l'image
        height: 80, // Hauteur de l'image
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover, // Ajustez l'image pour couvrir toute la zone
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: const Color.fromRGBO(156, 39, 176, 1),
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            duration,
            style: TextStyle(
              color: Colors.black, // Couleur du texte en noir
            ),
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.black, // Couleur du texte en noir
            ),
          ),
        ],
      ),
    );
  }
}
