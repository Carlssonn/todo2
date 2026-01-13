import 'package:flutter/material.dart';

class MTextField extends StatelessWidget {
  const MTextField({
    super.key,
    this.hint,
    required this.controller,
    required,
    this.BagraundColor = Colors.white,
    this.style,
    this.child,
  });
  final String? hint;
  final TextEditingController controller;
  final Color BagraundColor;
  final style;
  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(90), blurRadius: 4),
        ],
        color: BagraundColor,
      ),
      child: TextField(
        decoration: InputDecoration(hintText: hint, border: InputBorder.none,),
      ),
    );
  }
}
