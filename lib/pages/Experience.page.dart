import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projet_flutter/Widgets/_buildMapCard.dart';
import 'package:provider/provider.dart';
import 'package:projet_flutter/Widgets/CardTop.dart';
import 'package:projet_flutter/Widgets/ThemeNotifier.page.dart';
import 'package:projet_flutter/pages/ComCertif.page.dart';
import 'package:projet_flutter/pages/Etude.page.dart';
import 'package:projet_flutter/pages/Portfolio.page.dart';
import 'package:projet_flutter/pages/about.page.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      backgroundColor: const Color(0xff040305),
      appBar: AppBar(
        backgroundColor: const Color(0xff040305),
        elevation: 0,
        title: const Text('Expériences',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardTop(
                          icon: Icons.person_outline_rounded,
                          text: 'About Me',
                          isColor: false,
                          page: AboutMEPage()),
                      CardTop(
                          icon: Icons.work_outline_outlined,
                          text: 'Experience',
                          isColor: true,
                          page: ExperiencePage()),
                      CardTop(
                        icon: Icons.stacked_line_chart_sharp,
                        text: 'Education',
                        isColor: false,
                        page: EtudePage(),
                      ),
                      CardTop(
                        icon: Icons.stacked_line_chart_sharp,
                        text: 'Comptences Et Certification',
                        isColor: false,
                        page: ComCertifPage(),
                      ),
                      CardTop(
                        icon: Icons.stacked_line_chart_sharp,
                        text: 'Portfolio',
                        isColor: false,
                        page:
                            PortfolioPage(key: UniqueKey()), // Provide key here
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const MapCardWidget(
                title: 'Stagiaire : Site web CvThéque',
                education: 'Actia - Juin 2021 a Aout 2021',
                colorIcon: Color(0xffA36FF6),
                coordinates: LatLng(34.739822,
                    10.760020), // Remplacez par les coordonnées de votre adresse
              ),
              const MapCardWidget(
                title: 'Stagiaire : Prévision CA kastelo',
                education: 'Kastelo - aout 2023 a sept 2023',
                colorIcon: Color(0xff83DBC5),
                coordinates: LatLng(48.8566,
                    2.3522), // Remplacez par les coordonnées de votre adresse
              ),
              const MapCardWidget(
                title: 'Stagiaire : Dashboard avec BI',
                education: 'Clinisys - fév 2022 a mai 2022',
                colorIcon: Color(0xff0385DC),
                coordinates: LatLng(34.766910,
                    10.692062), // Remplacez par les coordonnées de votre adresse
              ),
            ],
          ),
        ),
      ),
    );
  }
}
