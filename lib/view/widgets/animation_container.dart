import 'package:dved_task/core/extension/context_extensions.dart';
import 'package:dved_task/view/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  final String message;
  const AnimationWidget({Key? key, required this.message}) : super(key: key);

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>  with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation _profilePictureAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _profilePictureAnimation = Tween(begin: 0.0, end: 400.0).animate(
        CurvedAnimation(parent: _controller,
            curve: const Interval(0.0, 0.20, curve: Curves.easeOut)));
    _controller.forward();
    _controller.addListener(() {});
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _controller.reverse();
      },
      child: Center(
        child: Container(
          width: _profilePictureAnimation.value,
          height: 88,
          decoration:  BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8)
          ),
          child:  Center(
            child: AppText(text: widget.message,color: Colors.white,size: context.h*0.024,fontWidget: FontWeight.w400,),
          ),
        ),
      ),
    );
  }
}
