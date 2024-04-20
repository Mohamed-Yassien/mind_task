import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';

enum TextStyleEnum {
  normal,
  title,
  caption,
}

class CustomText extends StatelessWidget {
  TextStyle getTextStyle(TextStyleEnum textStyleEnum,
      {Color? color,
      double? fontSize,
      String? fontFamily,
      TextOverflow? overflow,
      TextDecoration? decoration,
      FontWeight? weight}) {
    switch (textStyleEnum) {
      case TextStyleEnum.title:
        return TextStyle(
          fontSize: 18,
          color: AppColors.primary,
          fontFamily: "FFShamelFamily",
          height: 1,
          fontWeight: FontWeight.w600,
        ).copyWith(
            decoration: decoration,
            color: color ?? Colors.black,
            fontWeight: weight,
            fontSize: fontSize,
            height: 1,
            overflow: overflow ?? TextOverflow.visible,
            fontFamily: fontFamily ?? "FFShamelFamilys");
      case TextStyleEnum.caption:
        return const TextStyle(
                fontSize: 11,
                color: Colors.black,
                fontFamily: "FFShamelFamily",
                fontWeight: FontWeight.w300)
            .copyWith(
                decoration: decoration,
                color: color ?? Colors.black,
                fontWeight: weight,
                fontSize: fontSize,
                height: 1.7,
                overflow: overflow ?? TextOverflow.visible,
                fontFamily: fontFamily ?? "FFShamelFamily");

      default:
        return const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontFamily: "FFShamelFamily",
          height: 1.7,
          fontWeight: FontWeight.w400,
        ).copyWith(
            decoration: decoration,
            color: color ?? Colors.black,
            fontWeight: weight,
            fontSize: fontSize,
            height: 1.7,
            overflow: overflow ?? TextOverflow.visible,
            fontFamily: fontFamily ?? "FFShamelFamily");
    }
  }

  const CustomText(
    this.text, {
    Key? key,
    this.textStyleEnum,
    this.color,
    this.fontSize,
    this.weight,
    this.fontFamily,
    this.align,
    this.decoration,
    this.overflow,
    this.maxLines,
  }) : super(key: key);
  final String text;
  final TextStyleEnum? textStyleEnum;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final String? fontFamily;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final TextAlign? align;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      style: getTextStyle(
        textStyleEnum ?? TextStyleEnum.normal,
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        overflow: overflow,
        decoration: decoration,
        weight: weight,
      ),
    );
  }
}
