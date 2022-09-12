import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram/screens/share_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Color(0xff1C1F2E),
        elevation: 0,
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        actions: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(right: 18),
            child: Image.asset('images/icon_direct.png'),
          )
        ],
      ),
      backgroundColor: Color(0xff1C1F2E),
      body: Padding(
        padding: EdgeInsets.only(top: 13),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 120,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return _getAddStoryBox();
                          } else {
                            return _getStoryListBox(index);
                          }
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 24,
                          );
                        },
                        itemCount: 6),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    index++;
                    //post list
                    return Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              _getStoryBox(index),
                              //post header
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _getPostUsername(index),
                                    _getPostSubtitle(index),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Image.asset('images/icon_menu.png'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        //post content
                        Container(
                          height: 430,
                          width: 370,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Positioned(
                                top: 0,
                                child: ClipRRect(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: _getPostCover(index),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 15,
                                right: 15,
                                child: Image.asset('images/icon_video.png'),
                              ),
                              Positioned(
                                bottom: 25,
                                child: ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 20,
                                      sigmaY: 20,
                                    ),
                                    child: Container(
                                      width: 320,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color.fromRGBO(255, 255, 255, 0.5),
                                            Color.fromRGBO(255, 255, 255, 0.2),
                                          ],
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  'images/icon_hart.png'),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                '2.5 K',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'GB',
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  'images/icon_comments.png'),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                '1.5 K',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'GB',
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    barrierColor:
                                                        Colors.transparent,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Padding(
                                                        padding: EdgeInsets.only(
                                                            bottom:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets
                                                                    .bottom),
                                                        child:
                                                            DraggableScrollableSheet(
                                                          initialChildSize: 0.4,
                                                          minChildSize: 0.2,
                                                          maxChildSize: 0.7,
                                                          builder: ((context,
                                                              Controller) {
                                                            return ShareBottomsheet(
                                                                controller:
                                                                    Controller);
                                                          }),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Image.asset(
                                                    'images/icon_share.png'),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Image.asset(
                                                  'images/icon_save.png',
                                                  color: isSaved
                                                      ? Color(0xffF35383)
                                                      : Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  childCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPostCover(int index) {
    return Container(
      width: 370,
      height: 370,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FittedBox(
          child: Image.asset(
            'images/item$index.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getPostSubtitle(int index) {
    List<String> subtitles = [
      '',
      'امیراحمد برنامه نویس موبایل',
      'شمع ماهو',
      'وبکیو | طراحی سایت',
      'Seyed Mohammadjavad Hashemi',
      'Mojavad | UI Designer'
    ];
    return Text(
      subtitles[index],
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'SM',
        fontSize: 12,
      ),
    );
  }

  Widget _getStoryBox(int index) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      padding: EdgeInsets.all(4),
      color: Color(0xffF35383),
      strokeWidth: 2,
      dashPattern: [40, 10],
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          height: 40,
          width: 40,
          child: Image.asset('images/profile$index.png'),
        ),
      ),
    );
  }

  Widget _getStoryListBox(int index) {
    return Column(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          padding: EdgeInsets.all(4),
          color: Color(0xffF35383),
          strokeWidth: 2,
          dashPattern: [40, 10],
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              height: 58,
              width: 58,
              child: Image.asset('images/profile$index.png'),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        _getStoryUsername(index),
      ],
    );
  }

  Widget _getStoryUsername(int index) {
    List<String> usernames = [
      '',
      'amirahmad..',
      'Mahoo.can...',
      'Webq.co',
      'S_mojavad',
      'Mojavad_dev'
    ];
    return Text(
      usernames[index],
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'GM',
        fontSize: 13,
      ),
    );
  }

  Widget _getPostUsername(int index) {
    List<String> usernames = [
      '',
      'amirahmadadibii',
      'Mahoo.candle',
      'Webq.co',
      'S_mojavad',
      'Mojavad_dev'
    ];
    return Text(
      usernames[index],
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'GB',
        fontSize: 12,
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Column(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          padding: EdgeInsets.all(4),
          color: Colors.white,
          strokeWidth: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              height: 58,
              width: 58,
              child: Container(
                color: Color(0xff1C1F2E),
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'your story',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'GM',
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
