import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({super.key, required this.info});
  final Widget info;
  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(child: widget.info));
  }
}
