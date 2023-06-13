import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/components/avater_widget.dart';
import 'package:untitled/src/components/image_data.dart';
import 'package:untitled/src/controller/bottom_nav_controller.dart';
import 'package:untitled/src/pages/home.dart';
import 'package:untitled/src/pages/search.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.willPopAction,
      child: Obx(
              () =>
              Scaffold(
                body: IndexedStack(
                  index: controller.pageIndex.value,
                  children: [
                    const Home(),
                    Navigator(
                      key: controller.searchNavigationKey,
                      onGenerateRoute: (routeSetting) {
                        return MaterialPageRoute(
                          builder: (context) => const Search(),
                        );
                      },
                    ),
                    const Center(child: Text('UPLOAD')),
                    const Center(child: Text('ACTIVITY')),
                    const Center(child: Text('MYPAGE')),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: controller.pageIndex.value,
                  elevation: 0,
                  onTap: controller.changeBottomNav,
                  items: [
                    BottomNavigationBarItem(
                      icon: ImageData(IconsPath.homeOff),
                      activeIcon: ImageData(IconsPath.homeOn),
                      label: 'home',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageData(IconsPath.searchOff),
                      activeIcon: ImageData(IconsPath.searchOn),
                      label: 'home',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageData(IconsPath.uploadIcon),
                      label: 'home',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageData(IconsPath.activeOff),
                      activeIcon: ImageData(IconsPath.activeOn),
                      label: 'home',
                    ),
                    BottomNavigationBarItem(
                      icon: AvatarWidget(thumbPath:
                      'https://images.mypetlife.co.kr/content/uploads/2022/06/24114917/14717315053_0158b9be88_o-scaled.jpg',
                        type: AvatarType.TYPE2,
                        size: 50,),
                      /*
                  icon: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  */
                      label: 'home',
                    ),
                  ],
                ),
              )),
    );
  }
}
