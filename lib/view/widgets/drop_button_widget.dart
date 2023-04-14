import 'package:dved_task/core/extension/context_extensions.dart';
import 'package:dved_task/view/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

import '../../core/constants/color_const.dart';

class DropDownButtonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? inputTextColor;
  final Color? boxDecoration;
  final Color? boxBorderColor;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final dynamic Function(String?) callback;
  final  String value;
  final  String? collectionText;
  final List<String> regionLIst;

  const DropDownButtonWidget({Key? key,
    this.height = 56,
    this.width,
    this.fontSize,
    this.fontWeight,
    this.inputTextColor,
    this.collectionText,
    this.boxDecoration = Colors.white,
    this.boxBorderColor = Colors.white,
    this.borderRadius = 8,
    required this.callback,
    required this.value,
    required this.regionLIst
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
        children: [
           Positioned(
               top: context.h*0.01,
               left: context.w*0.016,
              child: AppText(text: collectionText ?? "",size: context.h*0.014,color: ColorConst.contentTextColor,)),
          Padding(
            padding:  EdgeInsets.only(left: context.w*0.026,top: context.h*0.017),
            child: DropdownButton(
              icon:  Container(
                margin:  EdgeInsets.only(right: context.w*0.015),
                  child: Image.asset("assets/dropdownIcon.png",width: context.w*0.023,height: context.h*0.032,)),
              isExpanded: true,
              underline: const SizedBox(),
              value: value.toString(),
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: inputTextColor ?? ColorConst.bigTextColor,
                fontWeight: fontWeight ?? FontWeight.w400,
                fontSize: fontSize ?? context.h*0.021,
              ),
              items: List.generate(
                  regionLIst.length,
                      (index) => DropdownMenuItem(
                    child: Text(regionLIst[index]),
                    value: regionLIst[index],
                  )),
              onChanged: callback,

            ),
          ),
        ],
      ),
    );
  }
}