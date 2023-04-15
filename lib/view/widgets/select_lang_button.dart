import 'package:dved_task/core/extension/context_extensions.dart';
import 'package:dved_task/view/widgets/app_text_widget.dart';
import 'package:dved_task/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/color_const.dart';
import '../../core/utils/utils.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(child:
            InkWell(
              onTap: (){
                const locale = Locale("uz", "UZ");
                context.read<AuthViewModel>().selectLang(context, locale);
                Navigator.pop(context);
              },
             child: Row(
               children: const [
                  CircleAvatar(
                   radius: 15, // Image radius
                   backgroundImage: AssetImage("assets/uzbekflag.jpg"),
                 ),
                 SizedBox(width: 8),
                 AppText(text: "O'zbek",size: 16,)
               ],
             ),

            )),
            PopupMenuItem(child:
            InkWell(
              onTap: (){
                const locale = Locale("ru", "RU");
                context.read<AuthViewModel>().selectLang(context, locale);
                Navigator.pop(context);
              },
             child: Row(
               children: const [
                  CircleAvatar(
                   radius: 15, // Image radius
                   backgroundImage: AssetImage("assets/ruflag.jpg"),
                 ),
                 SizedBox(width: 8),
                 AppText(text: "Русский",size: 16,)
               ],
             ),

            )),
            PopupMenuItem(child:
            InkWell(
              onTap: (){
                const locale = Locale("en", "US");
                context.read<AuthViewModel>().selectLang(context, locale);
                Navigator.pop(context);
              },
             child: Row(
               children: const [
                  CircleAvatar(
                   radius: 15, // Image radius
                   backgroundImage: AssetImage("assets/usaflag.jpg"),
                 ),
                 SizedBox(width: 8),
                 AppText(text: "English",size: 16,)
               ],
             ),

            )),
          ],
          child: Container(
            margin: EdgeInsets.only(top: context.h * 0.016),
            child: Row(
              children: [
                SizedBox(
                    width: context.w * 0.019,
                    height: context.h * 0.026,
                    child: Image.asset(Utils.assetsImagePath[3])),
                const SizedBox(width: 8),
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [ColorConst.beginColor, ColorConst.endColor],
                  ).createShader(bounds),
                  child: Text(
                    'English',
                    style: TextStyle(
                        fontSize: context.h * 0.021,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
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
