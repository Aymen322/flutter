import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Generated localization class
// For package version (optional)
import 'package:provider/provider.dart';
import 'package:projet_flutter/Widgets/ThemeNotifier.page.dart';
import 'package:projet_flutter/Widgets/CardTop.dart';
import 'package:projet_flutter/Widgets/InfoCard.dart';
import 'package:projet_flutter/pages/ComCertif.page.dart';
import 'package:projet_flutter/pages/Etude.page.dart';
import 'package:projet_flutter/pages/Experience.page.dart';
import 'package:projet_flutter/pages/about.page.dart';

import 'dart:convert'; // For JSON decoding

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({required Key key}) : super(key: key);

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  int _selectedIndex = 2; // Initial index for Education page
  final PageController _pageController = PageController(initialPage: 2);
  final List<Map<String, dynamic>> _pages = [
    {'title': 'About Me', 'icon': Icons.person_outline_rounded},
    {'title': 'Experience', 'icon': Icons.work_outline_outlined},
    {'title': 'Education', 'icon': Icons.stacked_line_chart_sharp},
    {
      'title': 'Comptences Et Certification',
      'icon': Icons.stacked_line_chart_sharp
    },
    {'title': 'Portfolio', 'icon': Icons.stacked_line_chart_sharp}
  ];
  String _selectedLanguage = 'en'; // Default language (English)
  Map<String, dynamic> _translations = {}; // Store loaded translations

  @override
  void initState() {
    super.initState();
    _loadTranslations(); // Load translations on widget initialization
  }

  Future<void> _loadTranslations() async {
    try {
      final jsonData = await rootBundle.loadString('assets/translations.json');
      _translations = jsonDecode(jsonData) as Map<String, dynamic>;
    } catch (error) {
      print('Error loading translations: $error');
    }
  }

  String _getTranslatedText(String key) {
    final translation = _translations[key]?['$_selectedLanguage'];
    return translation ?? key; // Return key if translation not found
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final locale = Localizations.localeOf(context); // Get current locale

    // Update selected language if locale changes
    if (_selectedLanguage != locale.languageCode) {
      setState(() {
        _selectedLanguage = locale.languageCode;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff040305),
        elevation: 0,
        title: Text(
          _getTranslatedText('education'), // Use translated title
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          DropdownButton<String>(
            value: _selectedLanguage,
            icon: const Icon(Icons.language),
            items: <DropdownMenuItem<String>>[
              DropdownMenuItem<String>(
                value: 'en',
                child: Text(_getTranslatedText('english')), // Translated label
              ),
              DropdownMenuItem<String>(
                value: 'fr',
                child: Text(_getTranslatedText('french')), // Translated label
              ),
            ],
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value!;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _pages.map((page) {
            return GestureDetector(
              onTap: () {
                final index = _pages.indexOf(page);
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              child: CardTop(
                icon: page['icon'],
                text: page[
                    'title'], // No need for translation here (handled by AppLocalizations)
                isColor: false,
                page: _buildPage(page['title']),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPage(String page) {
    switch (page) {
      case 'About Me':
        return AboutMEPage();
      case 'Experience':
        return ExperiencePage();
      case 'Education':
        return EtudePage();
      case 'Comptences Et Certification':
        return ComCertifPage();
      case 'Portfolio':
        return PortfolioPage(
            key: UniqueKey()); // Consider using a different page
      default:
        return Container();
    }
  }
}
