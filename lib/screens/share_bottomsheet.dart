import 'dart:ui';

import 'package:flutter/material.dart';

class ShareBottomsheet extends StatelessWidget {
  ShareBottomsheet({Key? key, this.controller}) : super(key: key);
  ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return _getBottomssheetContent();
  }

  Widget _getBottomssheetContent() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 30,
          sigmaY: 30,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 255, 255, 0.5),
                Color.fromRGBO(255, 255, 255, 0.2),
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CustomScrollView(
                controller: controller,
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 67,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Share',
                              style: TextStyle(
                                fontFamily: 'GB',
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Image.asset('images/icon_share_bottomsheet.png'),
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Container(
                          width: 340,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.4),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('images/icon_search.png'),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 11),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'Search...',
                                        hintStyle: TextStyle(
                                          fontFamily: 'GB',
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return _getGridItems(index);
                      },
                      childCount: 12,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 110,
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(top: 120),
                  ),
                ],
              ),
              Positioned(
                bottom: 47,
                child: SizedBox(
                  width: 129,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Send'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getGridItems(int index) {
    index++;
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset('images/profile$index.png'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        _getUsername(index),
      ],
    );
  }

  Widget _getUsername(int index) {
    List<String> usernames = [
      '',
      'amirahmadadibii',
      'Mahoo.candle',
      'Webq.co',
      'S_mojavad',
      'Mojavad_dev',
      'germany.lang',
      'sam_karman',
      'Abed.kamali',
      'Arash_313',
      'Alirezaaa',
      'yasiin_',
      'sara.Karimi',
    ];
    return Text(
      usernames[index],
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'GB',
        fontSize: 12,
      ),
    );
  }
}
