import 'package:bus_checking/Utilities/custom_font.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double height;
  final double width;
  final double borderRadius;
  final LinearGradient? gradient;
  final Color? textColor;
  final int? fontSize;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.height = 50.0,
    this.width = double.infinity,
    this.borderRadius = 25.0,
    this.gradient,
    this.textColor,
    this.textStyle,
    this.padding,
    this.margin,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 60,right: 60,top: 30),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: padding ?? EdgeInsets.zero,
            side: BorderSide.none, // Remove the border
          ).copyWith(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: gradient ?? const LinearGradient(
                colors: [Color(0xFF9558FE), Color(0xFFC681FE)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
                  : Text(
                text,
                // style: const TextStyle(fontSize: CustomFontSizes.medium,color: Colors.black),
                style: textStyle ?? TextStyle(color: textColor ?? Colors.white,fontSize: CustomFontSizes.medium),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
