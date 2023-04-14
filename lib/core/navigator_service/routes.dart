
import 'package:dved_task/view/screens/login_screen/login_page.dart';
import 'package:flutter/material.dart';


class MyRoutes {
  static final MyRoutes _instace = MyRoutes.init();
  static MyRoutes get instance => _instace;
  MyRoutes.init();

  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) =>  LoginPage());
    }
    return null;
  }
}
