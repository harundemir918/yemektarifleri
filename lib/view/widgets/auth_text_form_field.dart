import 'package:flutter/material.dart';

class AuthTextFormField extends StatefulWidget {
  final String label;
  final bool obscured;
  final TextEditingController controller;
  final TextInputType keyboard;

  AuthTextFormField({
    required this.label,
    required this.obscured,
    required this.controller,
    required this.keyboard,
  });

  @override
  _AuthTextFormFieldState createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.label,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        TextFormField(
          controller: widget.controller,
          onChanged: (val) {
            setState(() {
              widget.controller.text = val;
              final selection = TextSelection.collapsed(
                offset: widget.controller.text.length,
              );
              widget.controller.selection = selection;
            });
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Lütfen ${widget.label.toString().toLowerCase()} alanını boş bırakmayın.';
            }
            widget.controller.text = value;
            return null;
          },
          obscureText: widget.obscured,
          onEditingComplete: () => FocusScope.of(context).unfocus(),
        ),
      ],
    );
  }
}
