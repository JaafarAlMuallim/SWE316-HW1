import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key, required this.info});
  final Widget info;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: 55, minHeight: 55, minWidth: 50, maxWidth: 50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: Center(child: info),
      ),
    );
  }
}
