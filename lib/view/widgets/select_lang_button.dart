import 'package:dved_task/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../core/constants/color_const.dart';
import '../../core/constants/fonts_const.dart';
import '../../core/utils/utils.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        const SizedBox(),
        GestureDetector(
          onTap: (){},
          child: Container(
            margin: EdgeInsets.only(top: context.h*0.016),
            child: Row(
              children: [
                Image.asset(Utils.assetsImagePath[3]),
                const SizedBox(width: 8),
                ShaderMask(
                  shaderCallback: (bounds) =>  LinearGradient(
                    colors: [ColorConst.beginColor, ColorConst.endColor],
                  ).createShader(bounds),
                  child:  Text('English',
                    style: TextStyle(
                        fontSize: SizeConst.kMediumFont16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
