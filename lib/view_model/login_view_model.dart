

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier{
 bool isChecked = false;
 bool isVisibilityPassword = false;
 String value = "";
 bool isAnimation = true;
 bool isOpenMenu = false;

 checkboxChanged(bool value) {
  isChecked = value;
  notifyListeners();
 }
 visibility(){
  isVisibilityPassword = !isVisibilityPassword;
  notifyListeners();
 }

 selectCountry(String value){
  this.value = value;
  isAnimation = false;
  notifyListeners();
 }

 closeAnimation(){
  isAnimation = false;
  notifyListeners();
 }
 openMenu(){
  isOpenMenu = !isOpenMenu;
  notifyListeners();
 }

 selectLang(BuildContext context, locale){
  context.setLocale(locale);
  notifyListeners();
 }


}