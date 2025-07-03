import 'package:flutter/material.dart';

class Custom_btn extends StatelessWidget {
  const Custom_btn({
    super.key, required this.lable, required this.press,
  });
  final String lable;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: press, child: Text(lable,style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor:Colors.blueAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))));
  }
}