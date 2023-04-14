import 'package:flutter/material.dart';

import '../../core/constants/color_const.dart';
import 'app_text_widget.dart';

class TextFormFiledWidget extends StatelessWidget {
  final TextEditingController controller;
  final double? height;
  final double? width;
  final Color? boxDecoration;
  final Color? boxBorderColor;
  final Color? cursorColor;
  final Color? inputTextColor;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String validationText;
  final String? hindText;
  final String? collectionText;
  final FocusNode focusNode;
  final Icon? suffixIcon;
  final Function()? function;
  TextInputType? textInputType;
  final bool? obscureText;


  TextFormFiledWidget({Key? key,
    required this.controller,
    this.height = 56,
    this.width,
    this.boxDecoration = Colors.white,
    this.boxBorderColor = Colors.white,
    this.cursorColor,
    this.inputTextColor,
    this.borderRadius = 8,
    this.fontWeight,
    this.fontSize,
    required this.validationText,
    required this.focusNode,
    this.suffixIcon,
    this.function,
    this.hindText,
    this.textInputType,
    this.collectionText,
    this.obscureText,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          border: Border.all(
            color: boxBorderColor ?? Colors.white,
          ),
          color: boxDecoration,
          borderRadius: BorderRadius.circular(borderRadius ?? 8)
      ),
      child: Stack(
        children:[
          Positioned(
              top: 8,
              left: 12,
              child: AppText(text: collectionText ?? "",size: 10,color: ColorConst.contentTextColor,)),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 13),
          child: TextFormField(
            keyboardType: textInputType,
            obscureText: obscureText ?? false,
            cursorColor: cursorColor ?? ColorConst.bigTextColor,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: inputTextColor ?? ColorConst.bigTextColor,
              fontWeight: fontWeight ?? FontWeight.w400,
              fontSize: fontSize ?? 16,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: InkWell(
                  onTap: function,
                  child: suffixIcon ?? const SizedBox(),
                ) ,
                hintText: hindText
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return validationText;
              }
              return null;
            },
            controller: controller,
            focusNode: focusNode,
          ),
        ),
        ]
      ),
    );
  }
}