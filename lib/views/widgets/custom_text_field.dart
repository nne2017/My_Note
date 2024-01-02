import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
  });

  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: Colors.amber,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 18,
          ),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(
            Colors.amber,
          ),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red))),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
