import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projet_flutter/Widgets/CardTop.dart';
import 'package:projet_flutter/Widgets/ProgressBarCustom.dart';
import 'package:projet_flutter/Widgets/ThemeNotifier.page.dart';
import 'package:projet_flutter/pages/Etude.page.dart';
import 'package:projet_flutter/pages/Experience.page.dart';
import 'package:projet_flutter/pages/about.page.dart';

class ComCertifPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      backgroundColor: const Color(0xff040305),
      appBar: AppBar(
        backgroundColor: const Color(0xff040305),
        elevation: 0,
        title: const Text(
          'Compétences Et Certification',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardTop(
                        icon: Icons.person_outline_rounded,
                        text: 'About Me',
                        isColor: false,
                        page: AboutMEPage(),
                      ),
                      CardTop(
                        icon: Icons.work_outline_outlined,
                        text: 'Experience',
                        isColor: false,
                        page: ExperiencePage(),
                      ),
                      CardTop(
                        icon: Icons.stacked_line_chart_sharp,
                        text: 'Education',
                        isColor: false,
                        page: EtudePage(),
                      ),
                      CardTop(
                        icon: Icons.stacked_line_chart_sharp,
                        text: 'Compétences Et Certification',
                        isColor: true,
                        page: ComCertifPage(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 40.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff1F1E25),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Compétences',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 30.0),
                    progressBarCustom(
                      skill: 'angular',
                      prcentaje: '95',
                      color: Color(0xff0385DC),
                    ),
                    progressBarCustom(
                      skill: 'Springboot',
                      prcentaje: '80',
                      color: Color(0xff0385DC),
                    ),
                    progressBarCustom(
                      skill: 'Flutter',
                      prcentaje: '75',
                      color: Color(0xff0385DC),
                    ),
                    progressBarCustom(
                      skill: 'php',
                      prcentaje: '70',
                      color: Color(0xffF7605D),
                    ),
                    progressBarCustom(
                      skill: '.Net',
                      prcentaje: '70',
                      color: Color(0xffF7605D),
                    ),
                    progressBarCustom(
                      skill: 'Data Mining',
                      prcentaje: '70',
                      color: Color(0xffF7605D),
                    ),
                    progressBarCustom(
                      skill: 'java',
                      prcentaje: '70',
                      color: Color(0xffF7605D),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                'Certifications',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 15.0),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: const Color(0xff1F1E25),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border_outlined,
                          color: Color(0xffA36FF6),
                          size: 35,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'CCNA',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'iit - 2024',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Color(0xff1F1E25),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border_outlined,
                          color: Color(0xffA36FF6),
                          size: 35,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Delf',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'iit - 2024',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
