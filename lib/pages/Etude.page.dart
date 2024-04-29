import 'package:flutter/material.dart';
import 'package:projet_flutter/Widgets/CardCustom.dart';
import 'package:provider/provider.dart';
import 'package:projet_flutter/Widgets/CardTop.dart';
import 'package:projet_flutter/Widgets/ThemeNotifier.page.dart';
import 'package:projet_flutter/pages/ComCertif.page.dart';
import 'package:projet_flutter/pages/Experience.page.dart';
import 'package:projet_flutter/pages/Portfolio.page.dart';
import 'package:projet_flutter/pages/about.page.dart';

class EtudePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff040305),
        elevation: 0,
        title: const Text(
          'Education',
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
                        isColor: true,
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
                        page: PortfolioPage(key: UniqueKey()),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const CardCustom(
                text: 'Institut international technologie ',
                colorIcon: Color(0xffA36FF6),
                isEducation: true,
                education: '2012-2025 ',
              ),
              const CardCustom(
                text: 'Institut supérieur d"informatique',
                colorIcon: Color(0xffA36FF6),
                isEducation: true,
                education: '2019-2021 ',
              ),
              const CardCustom(
                text: 'Mahmoud magdich',
                colorIcon: Color(0xffA36FF6),
                isEducation: true,
                education: '2015-2019 ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
