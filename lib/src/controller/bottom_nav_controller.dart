import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/components/message_popup.dart';

import '../pages/upload.dart';

enum PageName { HOME, SERACH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value,{bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => Upload());
        break;
      case PageName.HOME:
      case PageName.SERACH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value,hasGesture);
        break;
    }
  }

  void _changePage(int value, bool hasGesture) {
    pageIndex(value);
    if(!hasGesture) return;
    if(bottomHistory.last == value)  return ;
    bottomHistory.add(value);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(context: Get.context!, builder: (context)=> MessagePopup(
          message: '종료하시겠습니까?',
          title: '시스템',
          okCallback: (){
            exit(0);
          },
        cancelCallback: Get.back,
      ));
      print('exit');
      return true;
    } else {
      print('goto before page');
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      _changePage(index,false);
      return false;
    }
  }
}
