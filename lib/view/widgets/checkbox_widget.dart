import 'package:dved_task/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/color_const.dart';
import '../../core/constants/fonts_const.dart';
import '../../view_model/login_view_model.dart';
import 'app_text_widget.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorConst.beginColor;
      }
      return context.watch<AuthViewModel>().isChecked
          ? ColorConst.beginColor
          : ColorConst.contentTextColor;
    }
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: context.watch<AuthViewModel>().isChecked,
              onChanged: (bool? value) {
                context.read<AuthViewModel>().checkboxChanged(value ?? false);
              },
            ),
            AppText(text: "Remember me",
              size: context.h*0.021,
              fontWidget: FontWeight.w400,
              color: ColorConst.contentTextColor,
            ),
          ],
        ),
        ShaderMask(
          shaderCallback: (bounds) =>  LinearGradient(
            colors: [ColorConst.beginColor, ColorConst.endColor],
          ).createShader(bounds),
          child:  Text('Forget password?',
            style: TextStyle(
                fontSize: context.h*0.021,
                color: Colors.white,
                fontWeight: FontWeight.w400
            ),
          ),
        ),
      ],
    );
  }
}
