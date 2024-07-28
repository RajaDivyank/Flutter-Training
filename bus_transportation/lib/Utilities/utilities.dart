import 'package:flutter/material.dart';

class CustomColors {
    // static const Color themeColors = Color.fromRGBO(0, 151, 136, 100);
    static const Color themeColors = Color.fromRGBO(111, 0, 255, 100);
    // static Colors themeColor = Colors.deepPurple as Colors;
    static const Color headingColors = Colors.white;
}

class CustomTextFormField extends StatelessWidget {
    final String labelText;
    final Icon? prefixIcon;
    final bool obscureText;
    final TextEditingController? controller;
    final TextInputType keyboardType;
    final TextStyle? labelStyle;
    final TextStyle? style;
    final InputBorder? border;
    final InputBorder? enabledBorder;
    final InputBorder? focusedBorder;
    final InputBorder? errorBorder;
    final EdgeInsetsGeometry contentPadding;
    final int? maxLength;
    final int maxLines;
    final int minLines;
    final bool enabled;
    final String? initialValue;
    final String? hintText;
    final TextStyle? hintStyle;
    final TextStyle? counterStyle;

    const CustomTextFormField({
        super.key,
        required this.labelText,
        this.prefixIcon,
        this.obscureText = false,
        this.controller,
        this.keyboardType = TextInputType.text,
        this.labelStyle,
        this.style,
        this.border,
        this.enabledBorder,
        this.focusedBorder,
        this.errorBorder,
        this.contentPadding = const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        this.maxLength,
        this.maxLines = 1,
        this.minLines=1,
        this.enabled = true,
        this.initialValue,
        this.hintText,
        this.hintStyle,
        this.counterStyle,
    });

    @override
    Widget build(BuildContext context) {
        return TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: style,
            maxLength: maxLength,
            maxLines: maxLines,
            minLines: minLines,
            enabled: enabled,
            initialValue: initialValue,
            decoration: InputDecoration(
                labelText: labelText,
                labelStyle: labelStyle,
                prefixIcon: prefixIcon,
                border: border ?? OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
                enabledBorder: enabledBorder,
                focusedBorder: focusedBorder,
                errorBorder: errorBorder,
                contentPadding: contentPadding,
                hintText: hintText,
                hintStyle: hintStyle,
                counterStyle: counterStyle,
            ),
        );
    }
}

class CustomButton extends StatelessWidget {
    final String text;
    final VoidCallback onPressed;
    final double width;
    final double height;
    final Color color;
    final double fontSize;
    final FontWeight fontWeight;
    final double borderRadius;
    final EdgeInsetsGeometry padding;

    const CustomButton({
        super.key,
        required this.text,
        required this.onPressed,
        this.width = 200.0,
        this.height = 50.0,
        this.color = Colors.black,
        this.fontSize = 22.0,
        this.fontWeight = FontWeight.w600,
        this.borderRadius = 50.0,
        this.padding = const EdgeInsets.all(10.0),
    });

    @override
    Widget build(BuildContext context) {
        return SizedBox(
            width: width,
            height: height,
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    padding: padding,
                    backgroundColor: color,
                ),
                child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                    ),
                ),
            ),
        );
    }
}

class CustomCard extends StatelessWidget {
    final Widget child;
    final double elevation;
    final Color? color;
    final EdgeInsetsGeometry margin;
    final ShapeBorder? shape;

    const CustomCard({
        super.key,
        required this.child,
        this.elevation = 1.0,
        this.color,
        this.margin = const EdgeInsets.all(4.0),
        this.shape,
    });

    @override
    Widget build(BuildContext context) {
        return Card(
            elevation: elevation,
            color: color,
            margin: margin,
            shape: shape,
            child: child,
        );
    }
}

class CustomListTile extends StatelessWidget {
    final Widget leading;
    final Widget title;
    final Widget? subtitle;
    final VoidCallback? onTap;
    final EdgeInsetsGeometry? contentPadding;
    final Widget? trailing;
    final bool enabled;

    const CustomListTile({
        super.key,
        required this.leading,
        required this.title,
        this.subtitle,
        this.onTap,
        this.contentPadding,
        this.trailing,
        this.enabled = true,
    });

    @override
    Widget build(BuildContext context) {
        return ListTile(
            leading: leading,
            title: title,
            subtitle: subtitle,
            onTap: onTap,
            contentPadding: contentPadding,
            trailing: trailing,
            enabled: enabled,
        );
    }
}