import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines,
    this.error,
    this.onChanged,
    this.suffixIcon,
    this.helperText,
  }) : super(key: key);
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? error;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      // height: MediaQuery.of(context).size.height * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(helperText ?? "", style: const TextStyle(fontSize: 13),),
          ),
          TextField(
            onChanged: onChanged,
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType ?? TextInputType.text,
            maxLines: maxLines ?? 1,
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