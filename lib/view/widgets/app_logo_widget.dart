import 'package:flutter/material.dart';
import 'package:dved_task/core/extension/context_extensions.dart';
import '../../core/constants/color_const.dart';
import '../../core/constants/fonts_const.dart';
import '../../core/utils/utils.dart';
import 'app_text_widget.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w*0.5,
      height: context.h*1,
      decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorConst.beginColor,
              ColorConst.endColor,
            ],
          )
      ),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: context.h*0.08),
              width: context.w*0.4,
              height: context.h*0.1,
              child: Image.asset(Utils.assetsImagePath[0])),
          Container(
              margin: EdgeInsets.only(top: context.h*0.03),
              width: context.w*0.27,
              height: context.h*0.4,
              child: Image.asset(Utils.assetsImagePath[2])),
          AppText(text: 'Welcome to Ecosystem of future',size: SizeConst.kExtraLargeFont24,color: ColorConst.whiteColor,),
          SizedBox(height: context.h*0.032),
          AppText(text: 'Please select your company and log in',size: SizeConst.kSmallFont14,color: ColorConst.whiteColor,)
        ],
      ),
    );
  }
}
