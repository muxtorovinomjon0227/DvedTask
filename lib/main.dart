
import 'package:dved_task/view_model/login_view_model.dart';
import 'package:dved_task/core/navigator_service/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
bool shouldUseFirestoreEmulator = false;



void main() async  {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRoutes.instance.onGenerateRoute,
      initialRoute: '/sign_in',
    );
  }
}
