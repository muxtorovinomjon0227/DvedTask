import 'package:dved_task/core/extension/context_extensions.dart';
import 'package:dved_task/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              top: context.h*0.01,
              left: context.w*0.016,
              child: AppText(text: collectionText ?? "",size: context.h*0.014,color: ColorConst.contentTextColor,)),
          Padding(
            padding:  EdgeInsets.only(left: context.w*0.026,top: context.h*0.016),
          child: TextFormField(
            keyboardType: textInputType,
            obscureText: obscureText ?? false,
            cursorColor: cursorColor ?? ColorConst.bigTextColor,
            style: TextStyle(
              color: inputTextColor ?? ColorConst.bigTextColor,
              fontWeight: fontWeight ?? FontWeight.w400,
              fontSize: fontSize ?? context.h*0.021,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: InkWell(
                  onTap: function,
                  child: Padding(
                    padding:  EdgeInsets.only(right: context.w*0.02),
                    child: suffixIcon ?? const SizedBox(),
                  ),
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