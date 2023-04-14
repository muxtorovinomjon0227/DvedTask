
import 'package:dved_task/view/screens/login_screen/login_page.dart';
import 'package:flutter/material.dart';

import '../../view/screens/back_page/back_page.dart';


class MyRoutes {
  static final MyRoutes _instace = MyRoutes.init();
  static MyRoutes get instance => _instace;
  MyRoutes.init();

  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/sign_in':
        return MaterialPageRoute(builder: (_) => LoginPage());
        case '/back_page':
        return MaterialPageRoute(builder: (_) =>  BackPage());
    }
    return null;
  }
}
