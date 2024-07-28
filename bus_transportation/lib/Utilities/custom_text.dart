import 'package:bus_checking/Utilities/custom_font.dart';
import 'package:flutter/material.dart';

class CustomTextLarge extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;

  static const TextStyle _defaultStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: CustomFontSizes.large,
    fontWeight: CustomFontWeights.boldFonts,
  );

  const CustomTextLarge(
      this.text, {
        super.key,
        this.style,
        this.textAlign = TextAlign.start,
        this.overflow = TextOverflow.clip,
        this.maxLines,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? _defaultStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
