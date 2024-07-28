import 'package:flutter/material.dart';

// class CustomTextFormField extends StatelessWidget {
//   final String hintText;
//   final bool isPassword;
//
//   const CustomTextFormField({
//     super.key,
//     required this.hintText,
//     this.isPassword = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: TextField(
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: Colors.white,
//           hintText: hintText,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25.0),
//             borderSide: BorderSide.none,
//           ),
//           contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
//           suffixIcon: isPassword ? const Icon(Icons.visibility_off) : null,
//         ),
//       ),
//     );
//   }
// }
class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final bool autocorrect;
  final bool autofocus;
  final TextInputAction textInputAction;
  final int? maxLines;
  final int? maxLength;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.textAlign = TextAlign.start,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.autofocus = false,
    this.textInputAction = TextInputAction.done,
    this.maxLines,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: validator,
        textAlign: textAlign,
        keyboardType: keyboardType,
        autocorrect: autocorrect,
        autofocus: autofocus,
        textInputAction: textInputAction,
        maxLines: maxLines,
        maxLength: maxLength,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          suffixIcon: isPassword
              ? IconButton(
            icon: const Icon(Icons.visibility_off),
            onPressed: () {
              // Handle the password visibility toggle here
            },
          )
              : null,
        ),
      ),
    );
  }
}
