import 'package:flutter/material.dart';

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: _getHeaderSection(),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getgallery(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 83,
              decoration: BoxDecoration(
                color: Color(0xff272B40),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 17, right: 17),
                    child: Text(
                      'Draft',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'GB',
                          color: Color(0xffF35383)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 17, right: 17),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'GB',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 17, right: 17),
                    child: Text(
                      'Take',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'GB',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _getHeaderSection() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xff1C1F2E),
      elevation: 0,
      title: Row(
        children: [
          Text(
            'Post',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GB',
              fontSize: 24,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset('images/icon_arrow.png'),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Row(
            children: [
              Text(
                'next',
                style: TextStyle(
                  fontFamily: 'GB',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 5),
              Image.asset('images/icon_next.png'),
            ],
          ),
        ),
      ],
    );
  }

  CustomScrollView _getgallery() {
    return CustomScrollView(
      slivers: [
        _getSelectedImage(),
        SliverPadding(
          padding: EdgeInsets.only(right: 17, left: 17, top: 5),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FittedBox(
                    child: Image.asset('images/item${index + 1}.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              childCount: 9,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(bottom: 83),
        )
      ],
    );
  }

  SliverPadding _getSelectedImage() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: 394,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FittedBox(
              child: Image.asset('images/item0.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
