import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final String label;
  final bool obscured;

  AuthTextFormField({
    required this.label,
    required this.obscured,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
          ),
          obscureText: obscured,
        ),
      ],
    );
  }
}
