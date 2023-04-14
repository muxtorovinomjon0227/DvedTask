import 'package:dved_task/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/color_const.dart';
import '../../view_model/login_view_model.dart';
import 'app_text_widget.dart';

final ScrollController _scrollController = ScrollController();
List<String> dropdownItems = ["Andijon", "Namangan", "Farg'ona","Samarqand","Buxaro"];

class SelectCompany {
 static Widget selectCompany(BuildContext context){
    return   GestureDetector(
      onTap: (){
        context.read<AuthViewModel>().openMenu();
      },
      child: Container(
        height: context.h * 0.075,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: ColorConst.contentTextColor
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: context.h*0.01,left: context.w*0.011,right: context.w*0.011),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: "Select company",
                    color: ColorConst.contentTextColor,
                    fontWidget: FontWeight.w400,
                    size: context.h*0.014,
                  ),
                  SizedBox(height: context.h*0.01),
                  AppText(text: context.read<AuthViewModel>().value,
                    color: ColorConst.bigTextColor,
                    fontWidget: FontWeight.w400,
                    size: context.h*0.022,
                  ),
                ],
              ),
              Container(
                  margin:  EdgeInsets.only(right: context.w*0.015),
                  child: Image.asset("assets/dropdownIcon.png",width: context.w*0.023,height: context.h*0.032,)),
            ],
          ),
        ),

      ),
    );
  }
}

class MenuWidget {
 static Widget buildMenu(BuildContext context) {
    return Container(
      height: context.h*0.376,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:  [
            BoxShadow(
              color: ColorConst.contentTextColor,
              blurRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: ColorConst.contentTextColor
          )
      ),
      child: Expanded(
          child: RawScrollbar(
            controller: _scrollController,
            thickness: 3,
            isAlwaysShown: true,
            thumbColor: ColorConst.beginColor,
            radius: const Radius.circular(5),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                  children: List.generate(dropdownItems.length, (index) =>
                      GestureDetector(
                        onTap: (){
                          context.read<AuthViewModel>().selectCountry(dropdownItems[index]);
                          context.read<AuthViewModel>().openMenu();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 12,left: 12,right: 12),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: context.w*0.046,
                                  height: context.h*0.064,
                                  child: Image.asset("assets/menu_image.png",fit: BoxFit.fill,)),
                              SizedBox(width: context.w*0.007),
                              AppText(text: dropdownItems[index],
                                size: context.h*0.021,
                                fontWidget: FontWeight.w400,
                                color: ColorConst.bigTextColor,)
                            ],
                          ),
                        ),
                      ))
              ),
            ),
          )),
    );
  }
}