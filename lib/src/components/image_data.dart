import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ImageData extends StatelessWidget{
   String icon;
   final double? width;
  ImageData(this.icon,{Key? key,this.width = 55}) : super(key : key);

  @override
Widget build(BuildContext context){
    return Image.asset(
        icon,
        width: width! /Get.mediaQuery.devicePixelRatio,
    );
  }
}

class IconPath(
 static String get homeOff => 'assets/images/bottom_nav_'
)