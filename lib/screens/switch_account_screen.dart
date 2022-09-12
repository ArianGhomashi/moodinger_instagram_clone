import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram/screens/main_screen.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('images/switch_account_background.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 287 - 63,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Container(
                        width: 340,
                        height: 352,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.5),
                              Color.fromRGBO(255, 255, 255, 0.2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 319 - 63,
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                            image: AssetImage('images/profile.png'),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'mobodevs',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => MainScreen())));
                        },
                        child: SizedBox(
                          width: 129,
                          height: 46,
                          child: Center(
                            child: Text('confirm'),
                          ),
                        ),
                        style: Theme.of(context).elevatedButtonTheme.style,
                      ),
                      SizedBox(height: 32),
                      Text(
                        'switch account',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 132, bottom: 63),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? /',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ' Sign up',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
