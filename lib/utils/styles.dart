import 'package:flutter/material.dart';

class Styles {
  Styles._();

  static TextStyle appbarStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 32,
      color: color ?? Colors.white,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle h1Style({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 22,
      color: color ?? Colors.white,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle h2Style({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 20,
      color: color ?? Colors.white,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle bodyStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 18,
      color: color ?? Colors.white,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle smallBodyStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      color: color ?? Colors.white,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}
