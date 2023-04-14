import 'package:dved_task/core/constants/color_const.dart';
import 'package:dved_task/core/extension/context_extensions.dart';
import 'package:dved_task/view/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/login_view_model.dart';
import '../../widgets/animation_container.dart';
import '../../widgets/app_text_widget.dart';
import '../../widgets/checkbox_widget.dart';
import '../../widgets/select_lang_button.dart';
import '../../widgets/suqare_button_widget.dart';
import '../../widgets/text_form_widget.dart';

class BackPage extends StatelessWidget {
  BackPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginEditController = TextEditingController();
  final TextEditingController _passwordEditController = TextEditingController();
  final FocusNode _loginFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  List<String> dropdownItems = ["Andijon", "Namangan", "Farg'ona"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildAppLogo(context),
    );
  }

  Widget _buildAppLogo(BuildContext ctx) {
    return Stack(children: [
      Row(
        children: [
          const AppLogo(),
          SizedBox(
            width: ctx.w * 0.5,
            height: ctx.h * 1,
            child: Container(
              margin:
                  EdgeInsets.only(left: ctx.w * 0.046, right: ctx.w * 0.046),
              child: Column(
                children: [
                  const SelectLanguage(),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: ctx.h * 0.114),
                        child: AppText(
                            text: 'Welcome back!',
                            color: ColorConst.bigTextColor,
                            size: ctx.h * 0.043,
                            fontWidget: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: ctx.h * 0.016),
                        child: AppText(
                            text: 'Please login to access your account.',
                            color: ColorConst.contentTextColor,
                            size: ctx.h * 0.021,
                            fontWidget: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: ctx.h * 0.014),
                        child: Row(
                          children: [
                            AppText(
                                text: 'Markaziy klinik shifoxonasi',
                                color: ColorConst.beginColor,
                                size: ctx.w * 0.028,
                                fontWidget: FontWeight.w700),
                            Image.asset(
                              "assets/dropdownIcon.png",
                              width: ctx.w * 0.023,
                              height: ctx.h * 0.032,
                              color: ColorConst.beginColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  textFormFiled(ctx),
                  SizedBox(height: ctx.h * 0.035),
                  const CheckboxWidget(),
                  SizedBox(height: ctx.h * 0.035),
                  squareButton(ctx),
                  SizedBox(height: ctx.h * 0.054),
                  sendRequest(ctx),
                ],
              ),
            ),
          )
        ],
      ),
      Positioned(
        left: ctx.w * 0.4746,
        top: ctx.h * 0.9166,
        child: Container(
          width: ctx.w * 0.05,
          height: ctx.h * 0.016,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorConst.beginColor,
              ColorConst.endColor,
            ],
          )),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: ctx.h * 0.064),
            child: const Center(
              child: AnimationWidget(
                message: 'Login or password uncorrect!',
              ),
            ),
          ),
          const SizedBox()
        ],
      )
    ]);
  }

  Widget textFormFiled(BuildContext ctx) {
    return Column(
      children: [
        SizedBox(height: ctx.h * 0.032),
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
                height: ctx.h * 0.075,
              ),
              SizedBox(height: ctx.h * 0.032),
              TextFormFiledWidget(
                boxBorderColor: ColorConst.contentTextColor,
                controller: _passwordEditController,
                validationText: 'Yaroqli ismni kiriting',
                focusNode: _passwordFocusNode,
                collectionText: "Password",
                height: ctx.h * 0.075,
                suffixIcon: ctx.watch<AuthViewModel>().isVisibilityPassword
                    ? Icon(
                        Icons.visibility,
                        color: ColorConst.contentTextColor,
                        size: ctx.h * 0.031,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: ColorConst.contentTextColor,
                        size: ctx.h * 0.031,
                      ),
                obscureText: !ctx.watch<AuthViewModel>().isVisibilityPassword,
                function: () {
                  ctx.read<AuthViewModel>().visibility();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget squareButton(BuildContext ctx) {
    return SquareButton(
      buttonText: 'Login',
      wight: ctx.w * 0.56,
      function: () async {
        // if (_formKey.currentState!.validate()) {}
      },
      enable: false,
    );
  }

  Widget sendRequest(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: "Don't have work?",
          color: ColorConst.contentTextColor,
          size: ctx.h * 0.021,
        ),
        const SizedBox(width: 5),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [ColorConst.beginColor, ColorConst.endColor],
          ).createShader(bounds),
          child: Text(
            'Sent request',
            style: TextStyle(
                fontSize: ctx.h * 0.021,
                color: Colors.white,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
