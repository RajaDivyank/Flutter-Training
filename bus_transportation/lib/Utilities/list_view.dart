import 'package:flutter/material.dart';

class DataListView extends StatelessWidget {
  final int dataLength;
  final displayWidget;

  const DataListView({super.key, required this.dataLength, required this.displayWidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Scrollbar(
        thickness: 5,
        radius: const Radius.circular(20),
        child: ListView.builder(
          itemBuilder: displayWidget,
          itemCount: dataLength,
        ),
      ),
    );
  }
}
