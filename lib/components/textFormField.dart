import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
 InputField({required this.label, required this.onChanged});
  late String label;
  late String onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: Colors.black, fontSize: 14),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
      ),
      onChanged: (value) {
        onChanged = value;
      },
    );
  }
}
