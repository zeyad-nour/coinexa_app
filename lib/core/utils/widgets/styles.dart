// ignore_for_file: constant_identifier_names

import 'package:coinexa_app/conistant.dart';
import 'package:flutter/material.dart';

abstract class Style {
  static const HomeTextStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static const TextStyle25 = TextStyle(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const headTitle_TextStyle = TextStyle(
    color: pTextColorDetailsPage,
    fontWeight: FontWeight.w600,
    fontSize: 17,
  );
  static const priceCrypto_TextStyle = TextStyle(
    color: pTextColorDetailsPage,
    fontWeight: FontWeight.w500,
    fontSize: 32,
  );
  static const rateStyle_TextStyle = TextStyle(
    color: colorRate,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
}
