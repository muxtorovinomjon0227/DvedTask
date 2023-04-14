import 'package:flutter/material.dart';

import '../../core/constants/color_const.dart';


class SquareButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final double? wight;
  final double? height;
  final double? fontSize;
  final Function function;
  final Icon? icon;
  final bool enable;
  SquareButton({Key? key,
    required this.buttonText,
    this.buttonColor,
    this.height = 49,
    this.wight = 396,
    this.buttonTextColor,
    this.fontSize = 16,
    required this.function,
    this.icon,
    required this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        width: wight,
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorConst.beginColor,
                ColorConst.endColor,
              ],
            ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: enable
              ? const CircularProgressIndicator(strokeWidth: 3, color: Colors.white,)
              : Text(buttonText,style:  TextStyle(fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              color: buttonTextColor ?? Colors.white,
              fontSize: fontSize),),
        ),
      ),
    );
  }
}