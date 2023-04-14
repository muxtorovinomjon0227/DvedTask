import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier{
 bool isChecked = false;
 bool isVisibilityPassword = false;
 String value = "Andijon";

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
  notifyListeners();
 }


}