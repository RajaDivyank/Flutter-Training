
import 'package:bus_checking/Utilities/custom_font.dart';
import 'package:bus_checking/Utilities/utilities.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String appBarTitle;

  const CustomAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: CustomColors.headingColors),
      title: Text(
        appBarTitle,
        style: const TextStyle(fontSize: CustomFontSizes.large, color: CustomColors.headingColors),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
