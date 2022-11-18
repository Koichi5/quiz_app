import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    required this.controller,
    this.obscureText = false,
    this.error,
    this.onChanged,
    this.suffixIcon,
  }) : super(key: key);
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final String? error;
  final Function(String)? onChanged;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: onChanged,
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              filled: true,
              hintText: title,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: error != ""
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          if(error != null)
            Text(
              error ?? "",
              style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.error),
            )
        ],
      ),
    );
  }
}