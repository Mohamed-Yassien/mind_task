// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/themes/colors.dart';

class DefaultTextField extends StatefulWidget {
  DefaultTextField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.label,
    this.hintText,
    this.suffixIcon,
    this.border,
    this.minLines,
    this.maxLines,
    this.onChange,
    this.validate,
    this.focusNode,
    this.inputFormatter = const [],
    this.contentPadding,
    this.readOnly = false,
    this.enable,
    this.prefixIcon,
    this.onTap,
    this.maxLength,
    this.borderColor = Colors.white,
    this.fillColor = Colors.white,
    this.textColor = Colors.black,
    this.hintColor,
    this.suffixIconColor = Colors.white,
    this.underlineInputBorder = Colors.white,
    this.isFill = false,
    this.onSubmit,
    this.isNumber = false,
    this.textSize = 16.0,
  }) : super(key: key);
  bool? enable;
  bool readOnly;
  TextInputType? keyboardType;
  Widget? suffixIcon;
  TextEditingController? controller;
  String? label;
  String? hintText;
  Color? fillColor;
  bool? isFill;
  Color? borderColor;
  String? Function(String?)? validate;
  Function()? onTap;
  FocusNode? focusNode;
  List<TextInputFormatter> inputFormatter;
  InputBorder? border;
  int? minLines;
  int? maxLength;
  Widget? prefixIcon;
  int? maxLines;
  Color? textColor;
  double? textSize;
  Color? hintColor;
  Color? suffixIconColor;
  Color? underlineInputBorder;
  bool isNumber;
  EdgeInsetsGeometry? contentPadding;
  Function(String)? onChange;
  Function(String)? onSubmit;

  @override
  _DefaultTextFieldState createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool? isPass;
  bool? visible;

  @override
  void initState() {
    isPass =
        widget.keyboardType == TextInputType.visiblePassword ? true : false;
    visible = isPass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 60.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          cursorColor: AppColors.primary,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
            letterSpacing: widget.isNumber ? 4.0 : 0.0,
            color: widget.textColor,
            fontSize: widget.textSize,
          ),
          enabled: widget.enable ?? true,
          onChanged: widget.onChange,
          focusNode: widget.focusNode,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: visible!,
          minLines: widget.minLines,
          maxLines: widget.maxLines ?? 1,
          maxLength: widget.maxLength,
          onFieldSubmitted: widget.onSubmit,
          inputFormatters: widget.inputFormatter,
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            counterText: "",
            hintStyle: TextStyle(
              letterSpacing: 0.0,
              fontSize: 14,
              color: widget.hintColor ?? AppColors.hintColor,
              fontWeight: FontWeight.w300,
            ),
            isDense: false,
            filled: widget.isFill,
            fillColor: widget.fillColor,
            prefixIcon: widget.prefixIcon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      widget.prefixIcon!,
                    ],
                  )
                : null,
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8.0,
                ),
            // fillColor: whiteColor70,
            hintText: widget.hintText,
            suffixIcon: widget.suffixIcon ??
                (isPass!
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            visible = !visible!;
                          });
                        },
                        icon: Icon(
                          !visible! ? Icons.visibility : Icons.visibility_off,
                          color: AppColors.primary,
                        ),
                      )
                    : widget.suffixIcon),

            labelText: widget.label,
            enabledBorder: widget.border ??
                OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.hintColor),
                  borderRadius: BorderRadius.circular(15),
                ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.hintColor),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: widget.border ??
                OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.hintColor),
                  borderRadius: BorderRadius.circular(15),
                ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: .5,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          validator: widget.validate,
        ),
      ),
    );
  }
}
