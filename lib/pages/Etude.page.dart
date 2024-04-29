import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:projet_flutter/Widgets/CardTop.dart';
import 'package:projet_flutter/Widgets/ThemeNotifier.page.dart';
import 'package:projet_flutter/Widgets/_buildEducationItem.dart';
import 'package:projet_flutter/pages/ComCertif.page.dart';
import 'package:projet_flutter/pages/Experience.page.dart';
import 'package:projet_flutter/pages/Portfolio.page.dart';
import 'package:projet_flutter/pages/about.page.dart';

class EtudePage extends StatefulWidget {
  @override
  _EtudePageState createState() => _EtudePageState();
}

class _EtudePageState extends State<EtudePage> {
final List<Map<String, dynamic>> _pages = [
  {'title': 'About Me', 'icon': Icons.person_outline_rounded},
  {'title': 'Experience', 'icon': Icons.work_outline_outlined},
  {'title': 'Education', 'icon': Icons.school},
  {'title': 'Competence', 'icon': Icons.star_border},
  {'title': 'Portfolio', 'icon': Icons.portrait},
];

  final PageController _pageController = PageController();
  Map<String, String> _translations = {};

  Future<void> _loadTranslations(String language) async {
    final localeData =
        await rootBundle.loadString('assets/translations.json');
    final jsonData = jsonDecode(localeData) as Map<String, dynamic>;
    final translations =
        jsonData['translations'][language] as Map<String, dynamic>;

    _translations = translations.cast<String, String>();
  }

  String _translate(String key) {
    return _translations[key] ?? key;
  }

  @override
  void initState() {
    super.initState();
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
          children: [
            const Text(
              'Etude',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const Spacer(),
            DropdownButton<String>(
              value: 'en',
              items: [
                const DropdownMenuItem(value: 'en', child: Text('English')),
                const DropdownMenuItem(value: 'fr', child: Text('Français')),
              ],
              onChanged: (value) async {
                await _loadTranslations(value!);
                setState(() {});
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
                      final textLength = (page['title']).length;
                      final containerWidth = textLength *
                          15.0; // Adjust the multiplier as needed
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
                            text: (page['title']),
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
              _buildEducationList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEducationList() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0),
        EducationItem(
          title: 'Institut international technologie',
          duration: '2012-2025',
          description: 'Université Nord Américaine Privée: Institut International de Technologie : C’est un organisme d’enseignement supérieur privé agréé par le Ministère de l’Enseignement Supérieur et de la Recherche Scientifique. Il a été inauguré le 23 Août 2012.',
          imagePath: 'lib/assets/iit.png',
        ),
        SizedBox(height: 20.0),
        EducationItem(
          title: 'Institut supérieur d\'informatique',
          duration: '2019-2021',
          description: 'L’ISIMS cherche, depuis sa création, l’excellence à travers une formation de qualité. Sa mission primordiale étant d’assurer la qualité de la formation et de la recherche couvrant les domaines de l’informatique et du Multimédia.',
          imagePath: 'lib/assets/isims.jpg',
        ),
        SizedBox(height: 20.0),
        EducationItem(
          title: 'Mahmoud magdich',
          duration: '2015-2019',
          description: 'C’est un organisme d’enseignement supérieur privé agréé par le Ministère de l’Enseignement Supérieur et de la Recherche Scientifique',
          imagePath: 'lib/assets/magdich.jpg',
        ),
      ],
    );
  }




  Widget _buildPage(String page, ThemeNotifier themeNotifier) {
    switch (page) {
      case 'About Me':
        return AboutMEPage();
      case 'Experience':
        return ExperiencePage();
      case 'Education':
        return EtudePage();
      case 'Competence':
        return ComCertifPage();
      case 'Portfolio':
        return PortfolioPage();
      default:
        return Container();
    }
  }

}