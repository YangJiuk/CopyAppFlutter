import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/components/avater_widget.dart';
import 'package:untitled/src/components/image_data.dart';

import 'message_popup.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});


  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
            thumbPath:
                'https://images.mypetlife.co.kr/content/uploads/2022/06/24114917/14717315053_0158b9be88_o-scaled.jpg',
            type: AvatarType.TYPE3,
            size: 40,
            nickname: '개발자 지망생',
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.postMoreIcon,
                width: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
        imageUrl:
            'https://post-phinf.pstatic.net/MjAyMDA5MjRfOTMg/MDAxNjAwOTE0NjI4ODEw.bGEJZbjnRj6I2pj51qlMRybek0wEkKeqFzkGGgPoZ5Qg.Xh0At4q_VOuluMR5i5a8vl_yjbWZBD7gSXlgslxvUYsg.PNG/6_%ED%8E%98%EB%A5%B4%EC%8B%9C%EC%95%88_%EC%B9%9C%EC%B9%A0%EB%9D%BC.png?type=w1200');
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(
                IconsPath.likeOffIcon,
                width: 65,
              ),
              SizedBox(
                width: 15,
              ),
              ImageData(
                IconsPath.replyIcon,
                width: 60,
              ),
              SizedBox(
                width: 15,
              ),
              ImageData(
                IconsPath.directMessage,
                width: 55,
              ),
            ],
          ),
          ImageData(
            IconsPath.bookMarkOffIcon,
            width: 55,
          ),
        ],
      ),
    );
  }

  Widget _infoDescriptions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '공감 3',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ExpandableText('포스트 1\n 이 글에는 아무 내용이 없습니다 \n 기대하지 마십시오 \n 마지막 경고입니다',
            prefixText: '개발자 지망생',
            onPrefixTap: (){
              showDialog(context: Get.context!, builder: (context)=> MessagePopup(
                message: '미개발 단계입니다',
                title: '바보', okCallback: () { Get.back(); },
              ));
            },
            prefixStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            expandText: '더보기',
          collapseText: '접기',
          maxLines: 3,
          expandOnTextTap: true,
          collapseOnTextTap: true,
          linkColor: Colors.grey,),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _header(),
          SizedBox(
            height: 15,
          ),
          _image(),
          SizedBox(
            height: 15,
          ),
          _infoCount(),
          _infoDescriptions(),
          /*
          _replyTextBtn(),
          _dateAgo(),
          */
        ],
      ),
    );
  }
}
