import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_flutter/pages/ComCertif.page.dart';
import 'package:provider/provider.dart';
import 'package:projet_flutter/Widgets/CardTop.dart';
import 'package:projet_flutter/Widgets/ThemeNotifier.page.dart';
import 'package:projet_flutter/Widgets/_buildStudyProjects.dart';
import 'package:projet_flutter/pages/Etude.page.dart';
import 'package:projet_flutter/pages/Experience.page.dart';
import 'package:projet_flutter/pages/about.page.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}
class _PortfolioPageState extends State<PortfolioPage> {
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
            const Text(
              (
                  'Portfolio'), // Translate app title using _translate method
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
                const DropdownMenuItem(value: 'en', child: Text('English')),
                const DropdownMenuItem(
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
                          duration: const Duration(milliseconds: 500),
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
          const SizedBox(height: 20.0),
              _buildStydyProjects(),

            ],
          )
        )
      )
    
      );
  }
   Widget _buildStydyProjects() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0),
        ProjectItem(
          title: 'Mobile App: Cv',
          description: 'Le projet consiste à développer votre curriculum vitae sous forme d’une application mobile',
          skills: ['Flutter'], 
        ),
        SizedBox(height: 20.0),
        ProjectItem(
          title: 'Web App: E-commerce Platform',
          description: 'Le projet consiste à développer un site web de  E-commerce ',
          skills: ['laravel.js'], // Liste des compétences
        ),
        SizedBox(height: 20.0),
        ProjectItem(
          title: 'Web App: Covoiturage Platform',
          description: 'Le projet consiste à développer un site web de covoiturage',
          skills: ['Flutter', 'Dart'], // Liste des compétences
        ),
          SizedBox(height: 20.0),
        ProjectItem(
          title: 'Web App: travel agency Platform',
          description: 'Le projet consiste à développer une agence de voyage ',
          skills: ['.net'], // Liste des compétences
        ),
          SizedBox(height: 20.0),
        ProjectItem(
          title: 'Web App: hotel agency Platform',
          description: 'Le projet consiste à développer une agence des hotels',
          skills: ['angular', 'laravel'], // Liste des compétences
        ),
      ],
    );
  }
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

