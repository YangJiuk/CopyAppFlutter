import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/components/image_data.dart';
import 'package:untitled/src/controller/bottom_nav_controller.dart';

class App extends GetView<BottomNavController>{
  const App({Key? key}): super(key :key);

  @override
  Widget build(BuildContext context){
    return WillPopScope(
        child:Obx(()=> Scaffold(
          appBar: AppBar(),
          body: Container(),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed ,
            showSelectedLabels: false ,
            showUnselectedLabels: false ,
            currentIndex: controller.pageIndex.value,
            elevation: 0,
            onTap: controller.changeBottomNav,
            items: [
              BottomNavigationBarItem
                (
                icon: ImageData(IconsPath.homeOff),
                activeIcon: ImageData(IconsPath.homeOn),
                label:  'home',
               ),BottomNavigationBarItem
                (
                icon: ImageData(IconsPath.searchOff),
                activeIcon: ImageData(IconsPath.searchOn),
                label:  'home',
              ),BottomNavigationBarItem
                (
                icon: ImageData(IconsPath.uploadIcon),
                label:  'home',
              ),BottomNavigationBarItem
                (
                icon: ImageData(IconsPath.activeOff),
                activeIcon: ImageData(IconsPath.activeOn),
                label:  'home',
              ),BottomNavigationBarItem
                (
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey
                  ),
                ),
                label:  'home',
              ),
            ],
         ),
        )),
        onWillPop: () async{
      return false;
    },
    );
  }
}