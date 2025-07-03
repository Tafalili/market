import 'package:flutter/material.dart';

class TEXT_FORM_FILD extends StatelessWidget {
  const TEXT_FORM_FILD({
    super.key, required this.text, required this.press,
  });

  final VoidCallback press;
  final String text;


  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: press, child: Text(text,style: TextStyle(color: Colors.blueAccent),),);
  }
}