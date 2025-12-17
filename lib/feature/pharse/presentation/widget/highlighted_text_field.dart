import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HighlightedTextField extends StatelessWidget {
  final TextEditingController controller;
  final List<String> hashtags;
  final Function(String) onChanged;
  final String hintText;
  final int maxLines;

  const HighlightedTextField({
    super.key,
    required this.controller,
    required this.hashtags,
    required this.onChanged,
    required this.hintText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      style: const TextStyle(fontSize: 16),
    );
  }
}