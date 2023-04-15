import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dved_task/core/extension/context_extensions.dart';
import 'package:provider/provider.dart';
import '../../core/constants/color_const.dart';
import '../../core/utils/utils.dart';
import '../../view_model/login_view_model.dart';
import 'app_text_widget.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
        builder: (context, authProviders, child) {
          return  Container(
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
                    height: context.h*0.13,
                    child: Image.asset(Utils.assetsImagePath[0])),
                Container(
                    margin: EdgeInsets.only(top: context.h*0.12),
                    width: context.w*0.27,
                    height: context.h*0.4,
                    child: Image.asset(Utils.assetsImagePath[2])),
                SizedBox(height: context.h*0.075),
                AppText(text: 'welcome'.tr(),size: context.h*0.038,color: ColorConst.whiteColor,),
                SizedBox(height: context.h*0.032),
                AppText(text: 'Please select your company and log in',size: context.h*0.021,color: ColorConst.whiteColor,)
              ],
            ),
          );
        });

  }
}
