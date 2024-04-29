import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projet_flutter/Widgets/CardTop.dart';
import 'package:projet_flutter/Widgets/InfoCard.dart';
import 'package:projet_flutter/Widgets/ThemeNotifier.page.dart';
import 'package:projet_flutter/pages/ComCertif.page.dart';
import 'package:projet_flutter/pages/Etude.page.dart';
import 'package:projet_flutter/pages/Experience.page.dart';
import 'package:projet_flutter/pages/Portfolio.page.dart';

// Import necessary libraries for translation
import 'package:flutter/services.dart'; // for rootBundle
import 'package:intl/intl.dart'; // for translations

class AboutMEPage extends StatefulWidget {
  @override
  _AboutMEPageState createState() => _AboutMEPageState();
}

class _AboutMEPageState extends State<AboutMEPage> {
  final List<Map<String, dynamic>> _pages = [
    {'title': 'About Me', 'icon': Icons.person_outline_rounded},
    {'title': 'Experience', 'icon': Icons.work_outline_outlined},
    {'title': 'Education', 'icon': Icons.stacked_line_chart_sharp},
    {'title': 'Competence', 'icon': Icons.stacked_line_chart_sharp},
    {'title': 'Portfolio', 'icon': Icons.stacked_line_chart_sharp},
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
        title: Row(
          // Add a dropdown menu for language selection (consider state management for selected language)
          children: [
            Text(
              _translate(
                  'About Me'), // Translate app title using _translate method
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
      body: SafeArea(
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
                    final textLength = _translate(page['title']).length;
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
                          text: _translate(
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
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _pages.map((page) {
                  final translatedInfo = {
                    'Full Name': _translate('Full Name'),
                    'Date of Birth': _translate('Date of Birth'),
                    'Place of Birth': _translate('Place of Birth'),
                    'Address': _translate('Address'),
                    'Phone': _translate('Phone'),
                    'Email': _translate('Email'),
                  };
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 80,
                            backgroundImage: AssetImage(
                                'assets/my_photo.jpg'), // Replace with your own image path
                          ),
                          const SizedBox(height: 20),
                          InfoCard(
                            text: translatedInfo['Full Name'] ??
                                'Full Name', // Use pre-translated info labels or fallback to default
                            value: 'Kharrat yasmine ',
                          ),
                          InfoCard(
                            text: translatedInfo['Date of Birth'] ??
                                'Date of Birth',
                            value: '16 Janvier 2001',
                          ),
                          InfoCard(
                            text: translatedInfo['Place of Birth'] ??
                                'Place of Birth',
                            value: 'Douz, Tunisie',
                          ),
                          InfoCard(
                            text: translatedInfo['Address'] ?? 'Address',
                            value: 'Route MAnzel cheker , Sfax, Tunisie',
                          ),
                          InfoCard(
                            text: translatedInfo['Phone'] ?? 'Phone',
                            value: '+216 20 568 004',
                          ),
                          InfoCard(
                            text: translatedInfo['Email'] ?? 'Email',
                            value: 'kharratyasmine@gmail.com',
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
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
        return PortfolioPage(key: UniqueKey());
      default:
        return Container();
    }
  }
}
