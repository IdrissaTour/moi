import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget{
  final String text;
  SectionTitle({required this.text});
  @override
  Widget build(BuildContext context) {

    return Padding(padding: EdgeInsets.all(5),
      child: Text( text, style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18
      ),

      ),

    );
  }

}