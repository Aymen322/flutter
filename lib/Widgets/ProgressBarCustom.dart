import 'package:flutter/material.dart';

class progressBarCustom extends StatelessWidget {
  final String skill;
  final String prcentaje;
  final Color color;
  final double barra;

  const progressBarCustom(
      {super.key,
      required this.skill,
      required this.prcentaje,
      required this.color,
      this.barra = 300});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(skill,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
              Text('$prcentaje%',
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 10.0),
          Stack(
            children: [
              Container(
                height: 9,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0), color: color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
