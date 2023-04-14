import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? fontWidget;
  const AppText({Key? key, required this.text,  this.size = 20, this.color, this.fontWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Text(
        text, style: TextStyle(color: color, fontSize: size, fontWeight: fontWidget,fontStyle: FontStyle.normal ),
      ),
    );
  }
}