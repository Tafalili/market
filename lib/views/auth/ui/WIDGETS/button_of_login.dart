import 'package:flutter/material.dart';

class button_of_login extends StatelessWidget {
  const button_of_login({
    super.key, required this.lable, required this.on_pressed,
  });
  final String lable;
  final VoidCallback on_pressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(lable),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10))),
            onPressed: on_pressed,
            child: Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
            )),
      ],
    );
  }
}