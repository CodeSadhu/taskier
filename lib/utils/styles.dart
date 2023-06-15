import 'package:appwrite_hack/utils/colors.dart';
import 'package:appwrite_hack/utils/strings.dart';
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
      fontSize: fontSize ?? 36,
      color: color ?? Colors.white,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontStyle: fontStyle,
      decoration: decoration,
      fontFamily: Strings.appFont,
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
      decoration: decoration,
      fontFamily: Strings.appFont,
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
      decoration: decoration,
      fontFamily: Strings.appFont,
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
      decoration: decoration,
      fontFamily: Strings.appFont,
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
      decoration: decoration,
      fontFamily: Strings.appFont,
    );
  }

  static InputDecoration inputDecoration({
    String? hintText,
    TextStyle? hintStyle,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),
      enabledBorder: enabledBorder ??
          const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
      focusedBorder: focusedBorder ??
          const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorPalette.primary,
            ),
          ),
    );
  }
}
