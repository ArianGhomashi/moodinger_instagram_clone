import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 80,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 17, top: 17),
                    child: Icon(Icons.menu),
                  ),
                ],
                backgroundColor: Color(0xff1C1F2E),
                expandedHeight: 173,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/item7.png',
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(14),
                  child: Container(
                    height: 14,
                    decoration: BoxDecoration(
                        color: Color(0xff1C1F2E),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff1C1F2E),
                            offset: Offset(0, 0.2),
                          ),
                        ]),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _getHeader(),
              ),
              SliverPersistentHeader(
                delegate: TabBarDelegate(
                  TabBar(
                    indicatorColor: Color(0xffF35383),
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 17),
                    tabs: [
                      Tab(icon: Image.asset('images/icon_tab_posts.png')),
                      Tab(icon: Image.asset('images/icon_tab_bookmark.png')),
                    ],
                  ),
                ),
                pinned: true,
                floating: true,
              )
            ];
          },
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 10, left: 17, right: 17),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FittedBox(
                              child: Image.asset('images/item$index.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        childCount: 10,
                      ),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 10),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FittedBox(
                              child: Image.asset('images/item$index.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        childCount: 10,
                      ),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffF35383),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FittedBox(
                  child: Image.asset('images/profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 70,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Arian - Mobile Developer',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gb',
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'mobodevs',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontFamily: 'GB',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset('images/icon_profile_edit.png'),
        ],
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  TabBarDelegate(this._tabbar);

  TabBar? _tabbar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xff1C1F2E),
      child: _tabbar,
    );
  }

  @override
  double get maxExtent => _tabbar!.preferredSize.height + 10;

  @override
  double get minExtent => _tabbar!.preferredSize.height + 10;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
