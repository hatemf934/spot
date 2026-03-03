import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: 1,
      height: MediaQuery.of(context).size.height * 0.05,
      indent: MediaQuery.of(context).size.width * 0.02,
      endIndent: MediaQuery.of(context).size.width * 0.02,
    );
  }
}
