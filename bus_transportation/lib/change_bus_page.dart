import 'package:flutter/material.dart';

class ChangeBusPage extends StatefulWidget {
  const ChangeBusPage({super.key});

  @override
  State<ChangeBusPage> createState() => _ChangeBusPageState();
}

class _ChangeBusPageState extends State<ChangeBusPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.purpleAccent,
          child: const Center(child: Text("Under construction",)),
        ),
      ),
    );
  }
}
