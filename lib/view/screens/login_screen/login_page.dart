import 'package:dved_task/core/constants/color_const.dart';
import 'package:dved_task/core/constants/fonts_const.dart';
import 'package:dved_task/core/extension/context_extensions.dart';
import 'package:dved_task/view/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/login_view_model.dart';
import '../../widgets/app_text_widget.dart';
import '../../widgets/drop_button_widget.dart';
import '../../widgets/select_lang_button.dart';
import '../../widgets/suqare_button_widget.dart';
import '../../widgets/text_form_widget.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);

   final _formKey = GlobalKey<FormState>();
   final TextEditingController _loginEditController = TextEditingController();
   final TextEditingController _passwordEditController = TextEditingController();


   final FocusNode _loginFocusNode = FocusNode();
   final FocusNode _passwordFocusNode = FocusNode();


   List<String> dropdownItems = ["Andijon","Namangan", "Farg'ona"];
   String value = "Andijon";
   bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _buildAppLogo(context),
    );
  }
  Widget _buildAppLogo(BuildContext ctx){
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorConst.beginColor;
      }
      return ctx.watch<AuthViewModel>().isChecked
          ? ColorConst.beginColor
          : ColorConst.contentTextColor;
    }
    return  Row(
    children: [
      const AppLogo(),
      SizedBox(
        width: ctx.w*0.5,
        height: ctx.h*1,
        child: Container(
          margin: EdgeInsets.only(left: ctx.w*0.046, right: ctx.w*0.046),
          child: Column(
           children: [
            const SelectLanguage(),
             Row(
               children: [
                 Container(
                     margin: EdgeInsets.only(top: ctx.h*0.21),
                     child: AppText(text: 'Log in',
                       color: ColorConst.bigTextColor,
                       size: SizeConst.kExtraLargeFont32,
                       fontWidget: FontWeight.w700),),
               ],
             ),
             Row(
               children: [
                 Container(
                     margin: EdgeInsets.only(top: ctx.h*0.016),
                     child: AppText(text: 'Please login to access your account.',
                       color: ColorConst.contentTextColor,
                       size: SizeConst.kSmallFont14,
                       fontWidget: FontWeight.w400),),
               ],
             ),
             textFormFiled(ctx),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 GestureDetector(
                   onTap: () async {
                     // ctx.watch<AuthViewModel>().isChecked == true
                     // ? ctx.read<AuthViewModel>().checkboxChanged(false)
                     // : ctx.read<AuthViewModel>().checkboxChanged(true);
                     // print("Button bosildi");
                   },
                   child: Row(
                     children: [
                       Checkbox(
                         checkColor: Colors.white,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                         fillColor: MaterialStateProperty.resolveWith(getColor),
                         value: ctx.watch<AuthViewModel>().isChecked,
                         onChanged: (bool? value) {
                           ctx.read<AuthViewModel>().checkboxChanged(value ?? false);
                         },
                       ),
                       AppText(text: "Remember me",
                       size: SizeConst.kSmallFont14,
                     fontWidget: FontWeight.w400,
                       color: ColorConst.contentTextColor,
                     ),
                     ],
                   ),
                 ),
                 ShaderMask(
                   shaderCallback: (bounds) =>  LinearGradient(
                     colors: [ColorConst.beginColor, ColorConst.endColor],
                   ).createShader(bounds),
                   child:  Text('Forget password?',
                     style: TextStyle(
                         fontSize: SizeConst.kSmallFont14,
                         color: Colors.white,
                         fontWeight: FontWeight.w400
                     ),
                   ),
                 ),
               ],
             ),

             squareButton(),
           ],
          ),
        ),
      )
    ],
      );
  }

  Widget textFormFiled(BuildContext ctx){
    return   Column(
      children: [
        SizedBox(height: ctx.h*0.032),
        DropDownButtonWidget(
            value: value,
            regionLIst: dropdownItems,
            borderRadius: 8,
            boxBorderColor: ColorConst.contentTextColor,
            collectionText: "Select company",
            callback: (value) {}),
        SizedBox(height: ctx.h*0.032),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormFiledWidget(
                boxBorderColor: ColorConst.contentTextColor,
                controller: _loginEditController,
                validationText: 'Yaroqli ismni kiriting',
                focusNode: _loginFocusNode,
                collectionText: "Login",
              ),
              SizedBox(height: ctx.h*0.032),
              TextFormFiledWidget(
                boxBorderColor: ColorConst.contentTextColor,
                controller: _passwordEditController,
                validationText: 'Yaroqli ismni kiriting',
                focusNode: _passwordFocusNode,
                collectionText: "Password",
                suffixIcon: ctx.watch<AuthViewModel>().isVisibilityPassword
                    ?  Icon(Icons.visibility,color: ColorConst.contentTextColor,)
                    :  Icon(Icons.visibility_off,color: ColorConst.contentTextColor),
                  obscureText: !ctx.watch<AuthViewModel>().isVisibilityPassword,
                function: (){
                  ctx.read<AuthViewModel>().visibility();
                },

              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget squareButton(){
    return  SquareButton(
      buttonText: 'Login',
      function: () async {
        if (_formKey.currentState!.validate()) {}
      },
      enable: false,
    );
  }

}
