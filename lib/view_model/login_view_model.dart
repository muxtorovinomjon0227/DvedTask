import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier{
 bool isChecked = false;
 bool isVisibilityPassword = false;

 checkboxChanged(bool value) {
  isChecked = value;
  notifyListeners();
 }
 visibility(){
  isVisibilityPassword = !isVisibilityPassword;
  notifyListeners();
 }

}