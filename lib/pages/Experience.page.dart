import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projet_flutter/Widgets/ExperienceCard.dart';
import 'package:projet_flutter/Widgets/_buildMapCard.dart';
import 'package:provider/provider.dart';
import 'package:projet_flutter/Widgets/CardTop.dart';
import 'package:projet_flutter/Widgets/ThemeNotifier.page.dart';
import 'package:projet_flutter/pages/ComCertif.page.dart';
import 'package:projet_flutter/pages/Etude.page.dart';
import 'package:projet_flutter/pages/Portfolio.page.dart';
import 'package:projet_flutter/pages/about.page.dart';
// Import necessary libraries for translation
import 'package:flutter/services.dart'; // for rootBundle
import 'package:intl/intl.dart'; //


class ExperiencePage extends StatefulWidget {
  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
 final List<Map<String, dynamic>> _pages = [
  {'title': 'About Me', 'icon': Icons.person_outline_rounded},
  {'title': 'Experience', 'icon': Icons.work_outline_outlined},
  {'title': 'Education', 'icon': Icons.school},
  {'title': 'Competence', 'icon': Icons.star_border},
  {'title': 'Portfolio', 'icon': Icons.portrait},
];
final PageController _pageController = PageController();
// Add a variable to store translations for the current language
  Map<String, String> _translations = {};

  // Add a method to load translations from JSON files
  Future<void> _loadTranslations(String language) async {
    final localeData = await rootBundle.loadString('assets/translations.json');
    final jsonData = jsonDecode(localeData) as Map<String, dynamic>;
    final translations =
        jsonData['translations'][language] as Map<String, dynamic>;

    _translations = translations.cast<String, String>();
  }

  // Pre-translate strings before building the UI
  String _translate(String key) {
    return _translations[key] ?? key; // Return key if translation not found
  }

  @override
  void initState() {
    super.initState();
    // Load translations for the default language (English) on initial state
    _loadTranslations('en');
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

     final translatedTitles =
        _pages.map((page) => _translate(page['title'])).toList();

    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: const Color(0xff040305),
        elevation: 0,
        title:Row(
          // Add a dropdown menu for language selection (consider state management for selected language)
          children: [
            Text(
              (
                  'Experience'), // Translate app title using _translate method
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const Spacer(),
            DropdownButton<String>(
              value:
                  'en', // Consider using a state variable for selected language
              items: [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(
                    value: 'fr', child: Text('Français')), // Add French option
              ],
              onChanged: (value) async {
                // Update translations and potentially rebuild UI on language change (consider state management)
                await _loadTranslations(value!);
                setState(() {}); // Rebuild UI with new translations
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Switch(
                value: themeNotifier.isDarkMode,
                onChanged: (value) {
                  themeNotifier.toggleTheme();
                },
              ),
              Container(
              height: 80,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _pages.map((page) {
                    final textLength =(page['title']).length;
                    final containerWidth =
                        textLength * 15.0; // Adjust the multiplier as needed
                    return GestureDetector(
                      onTap: () {
                        final index = _pages.indexOf(page);
                        _pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Container(
                        width: containerWidth,
                        height: 110,
                        child: CardTop(
                          icon: page['icon'],
                          text:(
                              page['title']), // Use pre-translated titles
                          isColor: themeNotifier.isDarkMode,
                          page: _buildPage(page['title'], themeNotifier),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
             const Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    SizedBox(height: 20.0),
    ExperienceCard(
  title: 'Stagiaire : Site web CvThéque',
  duration: 'Actia - Juin 2021 a Aout 2021',
  description: 'Conception et développement d’un site web Cvthéque',
  imagePath: 'lib/assets/image1.jpg', // Chemin de l'image
),
    SizedBox(height: 20.0),
    ExperienceCard(
      title: 'Stagiaire : Prévision CA kastelo',
      duration: 'Kastelo - aout 2023 a sept 2023',
      description: 'Modéle de prédiction pour prédire les chiffres d"affaire du boutique',
      imagePath: 'lib/assets/image2.png', // Chemin de l'image
    ),
    SizedBox(height: 20.0),
    ExperienceCard(
      title: 'Stagiaire : Dashboard avec BI',
      duration: 'Clinisys - fév 2022 a mai 2022',
      description: 'Analyser des données expérimenté avec une solide expertise en visualisation et analyse de données grâce à l"utilisation avancée de Power BI',
      imagePath: 'lib/assets/image3.png', // Chemin de l'image    
    ),
  ],
)
            ],
          ),
        ),
      ),
    );
  }
  

  // No changes needed in _buildPage function
  Widget _buildPage(String page, ThemeNotifier themeNotifier) {
    final isColor = themeNotifier.isDarkMode;
    switch (page) {
      case 'About Me':
        return AboutMEPage(); // Assuming AboutMEPage contains translated content
      case 'Experience':
        return ExperiencePage(); // Assuming ExperiencePage contains translated content
      case 'Education':
        return EtudePage(); // Assuming EtudePage contains translated content
      case 'Competence':
        return ComCertifPage(); // Assuming ComCertifPage contains translated content
      case 'Portfolio':
        return PortfolioPage();
      default:
        return Container();
    }
  }
}