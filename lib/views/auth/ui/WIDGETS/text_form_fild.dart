import 'package:flutter/material.dart';

class CustomTFF extends StatelessWidget {
  const CustomTFF({

    super.key,
    required this.control_password, required this.lable, this.suffexicon, this.obscureText=false, this.textInputType
  });

  final TextEditingController control_password;
  final String lable;
  final Widget? suffexicon;
  final obscureText;
  final TextInputType?textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: control_password,
      // Fixed: Use control_password instead of control_username
      decoration: InputDecoration(
        suffixIcon: suffexicon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Colors.grey), // Set border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Colors
                  .black12), // Border color when enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Colors.black,
              width: 2), // Border color when focused
        ),
        filled: true,
        fillColor: Colors.white,
        label: Text(
          lable,
          style: TextStyle(color: Colors.black12),
        ),
      ),
    );
  }
}