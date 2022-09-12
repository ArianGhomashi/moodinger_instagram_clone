import 'package:flutter/material.dart';
import 'package:instagram/screens/activity_screen.dart';
import 'package:instagram/screens/add_content_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/search_screen.dart';
import 'package:instagram/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Color(0xff272B40),
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedBottomNavigationBarIndex,
            onTap: (int index) {
              setState(() {
                _selectedBottomNavigationBarIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_home.png'),
                activeIcon: Image.asset('images/icon_active_home.png'),
                label: 'item1',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_search_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_search_navigation_active.png'),
                label: 'item1',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_add_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_add_navigation_active.png'),
                label: 'item1',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_activity_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_activity_navigation_active.png'),
                label: 'item1',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffC5C5C5),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: FittedBox(
                      child: Image.asset('images/profile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                activeIcon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffF35383),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: FittedBox(
                      child: Image.asset('images/profile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                label: 'item1',
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomNavigationBarIndex,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      AddContentScreen(),
      ActivityScreen(),
      UserProfileScreen(),
    ];
  }
}
