import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getSearchScreenContent(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 17),
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
                    QuiltedGridTile(2, 1),
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
      ),
    );
  }

  Column _getSearchScreenContent() {
    return Column(
      children: [
        Container(
          width: 394,
          height: 46,
          margin: EdgeInsets.only(left: 17, right: 17, top: 20),
          decoration: BoxDecoration(
            color: Color(0xff272B40),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 8,
                ),
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
                Image.asset('images/icon_scan.png'),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
        ),
        _getCategoryList(),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _getCategoryList() {
    return Container(
      height: 23,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 60,
                  height: 23,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Color(0xff272B40),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'topic $index',
                      style: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 14,
            );
          },
          itemCount: 10),
    );
  }
}
