import 'package:flutter/material.dart';
import 'package:shoppe/configs/app_typography.dart';
import 'package:shoppe/configs/configs.dart';

Widget TextFieldTopText(text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Space.yf(1.2),
      Text(
        text,
        style: AppText.b1b,
      ),
      Space.yf(.7),
    ],
  );
}