import 'package:flutter/material.dart';
import 'package:instagram/model/enums/actions_activity_screen_enum.dart';
import 'dart:math';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  Random random = Random();
  int randomNumber = 1;
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: Color(0xff1C1F2E),
              child: TabBar(
                labelColor: Colors.white,
                indicatorColor: Color(0xffF35383),
                indicatorWeight: 4,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 17),
                labelStyle: TextStyle(
                  fontFamily: 'GB',
                  fontSize: 16,
                ),
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getListSample(),
                  _getListSample(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomScrollView _getListSample() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30,
              top: 32,
            ),
            child: Text(
              'New',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              randomNumber = random.nextInt(12) + 1;
              return _getRow(ActivityScreenStatus.followBack);
            },
            childCount: 2,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30,
              top: 32,
            ),
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              randomNumber = random.nextInt(12) + 1;
              return _getRow(ActivityScreenStatus.likes);
            },
            childCount: 5,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30,
              top: 32,
            ),
            child: Text(
              'This Week',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              randomNumber = random.nextInt(12) + 1;
              return _getRow(ActivityScreenStatus.following);
            },
            childCount: 4,
          ),
        ),
      ],
    );
  }

  Widget _getRow(ActivityScreenStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 17),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Color(0xffF35383),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Container(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FittedBox(
                child: Image.asset('images/profile$randomNumber.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _getUsername(randomNumber),
                  Text(
                    ' Started following',
                    style: TextStyle(
                      fontFamily: 'GM',
                      color: Color(0xffC5C5C5),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'you',
                    style: TextStyle(
                      fontFamily: 'GM',
                      color: Color(0xffC5C5C5),
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    ' 3min',
                    style: TextStyle(
                      fontFamily: 'GB',
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          _getActionsActivityScreenRow(status),
        ],
      ),
    );
  }

  Widget _getActionsActivityScreenRow(ActivityScreenStatus status) {
    switch (status) {
      case ActivityScreenStatus.following:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Color(0xffC5C5C5),
              width: 2,
            ),
          ),
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              color: Color(0xffC5C5C5),
              fontFamily: 'GB',
              fontSize: 12,
            ),
          ),
        );

      case ActivityScreenStatus.likes:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/item1.png'),
            ),
          ),
        );

      case ActivityScreenStatus.followBack:
        return ElevatedButton(
          onPressed: () {},
          child: SizedBox(
            child: Center(
              child: Text(
                'confirm',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GB',
                  fontSize: 12,
                ),
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        );
      default:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Color(0xffC5C5C5),
              width: 2,
            ),
          ),
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              color: Color(0xffC5C5C5),
              fontFamily: 'GB',
              fontSize: 12,
            ),
          ),
        );
    }
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
