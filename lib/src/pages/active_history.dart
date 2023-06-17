import 'dart:math';
import 'package:flutter/material.dart';
import 'package:untitled/src/components/avater_widget.dart';

class ActiveHistory extends StatelessWidget {
  const ActiveHistory({super.key});

  static List<String> catNicknames = [
    '애기냥',
    '미야옹',
    '그림냥',
    '토끼냥',
    '귀염냥',
    '초코냥',
    '눈물냥',
    '졸귀냥',
    '고롱냥',
    '코코넛',
    '바니냥',
    '꼬미냥',
    '하트냥',
    '멍냥이',
    '하얀냥',
    '멋쟁이냥',
    '피치냥',
    '호냥님',
    '쏘영냥',
    '올리버',
    '뽀냥이',
    '금붕어냥',
    '잉어냥',
    '복실냥',
    '소피냥',
    '야옹이',
    '점박이냥',
    '귀요미냥',
    '흰눈냥',
    '무지냥',
    '쿠키냥',
    'Nick',
    'Misty',
    'Luna',
    'Charlie',
    'Lucy',
    'Toby',
    'Leo',
    'Max',
    'Sasha',
    'Bella',
    'Ginger',
    'Oscar',
    'Milo',
    'Lily',
    'Rocky',
    'Sophie',
    'Molly',
    'Chloe',
    'Sam',
    'Shadow',
    'Simba',
    'Jack',
    'Zoe',
    'Ruby',
    'Lucky',
    'Coco',
    'Angel',
    'Tiger',
    'Casper',
    'Daisy',
    'Buddy',
    'Oliver',
    'Mittens',
    'Whiskers',
  ];

  Widget _activeItemone({required String? userName, required String? time}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          AvatarWidget(
              thumbPath:
                  'https://img.freepik.com/free-photo/close-up-portrait-on-beautiful-cat_23-2149214373.jpg',
              size: 40,
              type: AvatarType.TYPE2),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text.rich(
            TextSpan(
                text: userName,
                style: const TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '$userName님이 회원님의 게시물을 좋아합니다 등의 활동 내역',
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text: '$time 시간 등의 시간 경과 표시',
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.black45),
                  ),
                ]),
          )),
        ],
      ),
    );
  }

//하루 활동
  Widget _newRecntlyActiveView({required String? title}) {
    Random random = Random();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '$title',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          //정보 내역
          _activeItemone(
              userName: catNicknames[random.nextInt(catNicknames.length)],
              time : (1 + Random().nextInt(4)).toStringAsFixed(1)),//정보 내역
          _activeItemone(
              userName: catNicknames[random.nextInt(catNicknames.length)],
              time : (1 + Random().nextInt(4)).toStringAsFixed(1)),//정보 내역
          _activeItemone(
              userName: catNicknames[random.nextInt(catNicknames.length)],
              time : (1 + Random().nextInt(4)).toStringAsFixed(1)),//정보 내역
          _activeItemone(
              userName: catNicknames[random.nextInt(catNicknames.length)],
              time : (1 + Random().nextInt(4)).toStringAsFixed(1)),//정보 내역
          _activeItemone(
              userName: catNicknames[random.nextInt(catNicknames.length)],
              time : (1 + Random().nextInt(4)).toStringAsFixed(1)),//정보 내역
          _activeItemone(
              userName: catNicknames[random.nextInt(catNicknames.length)],
              time : (1 + Random().nextInt(4)).toStringAsFixed(1)),//정보 내역
          _activeItemone(
              userName: catNicknames[random.nextInt(catNicknames.length)],
              time : (1 + Random().nextInt(4)).toStringAsFixed(1)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '활동',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _newRecntlyActiveView(title: '오늘'),
            _newRecntlyActiveView(title: '일주일'),
            _newRecntlyActiveView(title: '한달'),
          ],
        ),
      ),
    );
  }
}
