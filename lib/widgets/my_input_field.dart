import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final bool isPasswordField;
  final String placeholder;
  final String label;
  final Function onChange;
  const MyInputField({
    super.key,
    required this.placeholder,
    required this.onChange,
    required this.label,
    this.isPasswordField = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 32,
            color: const Color.fromRGBO(103, 0, 151, 1).withOpacity(.1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            obscureText: isPasswordField,
            onChanged: (value) {
              onChange(value);
            },
            decoration: InputDecoration(
              hintText: placeholder,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
