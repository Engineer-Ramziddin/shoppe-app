import 'package:google_fonts/google_fonts.dart';

import '../../configs/configs.dart';
import '../../core/constant/colors.dart';

import 'package:flutter/material.dart';

/*Widget buildTextFormField(TextEditingController controller, String labelText,
    {bool isObscure=false}) {
  return Container(
    height: AppDimensions.normalize(20),
    padding: Space.h1,
    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    child: Center(
      child: TextFormField(
        controller: controller,
        obscureText: isObscure,
        validator: (String? val) {
          if (val == null || val.isEmpty) {
            return 'This field can\'t be empty';
          }
          return null;
        },
        cursorColor: AppColors.CommonCyan,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your $labelText",
          hintStyle: const TextStyle(
            fontSize: 12,
            color: AppColors.GreyText,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
  );
}*/

Widget buildTextFormField(TextEditingController controller, String labelText,
    {bool isObscure = false}) {
  return TextFormField(
    controller: controller,
    obscureText: isObscure,
    validator: (String? val) {
      if (val == null || val.isEmpty) {
        return 'This field can\'t be empty';
      }
      return null;
    },
    decoration: InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 16.69, horizontal: 19.76),
      border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(59.0))),
      hintText: "Enter your $labelText",
      hintStyle: TextStyle(
          fontSize: 14,
          color: AppColors.GreyText,
          fontWeight: FontWeight.normal,
          fontFamily: GoogleFonts.poppins().fontFamily),
      filled: true,
      fillColor: AppColors.Bg248,
    ),
  );
}
