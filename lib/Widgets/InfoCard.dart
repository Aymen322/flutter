import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {

  
  final String text;
  final String value;
 

  const InfoCard({

    required this.text,
    required this.value,
   
  });

 
  @override
  Widget build(BuildContext context) {
     return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(value),
        ),
      ),
     );
  }
}