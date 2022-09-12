import 'package:flutter/material.dart';
import 'package:instagram/screens/switch_account_screen.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });

    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff323A99), Color(0xffF98BFC)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [_getImage(), _getContainerBox()],
        ),
      ),
    );
  }

  Widget _getImage() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 40,
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage('images/rocket.png'),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget _getContainerBox() {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff1C1F2E),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in to ',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Image(image: AssetImage('images/mood.png'))
                  ],
                ),
                SizedBox(
                  height: 36,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    focusNode: negahban1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'GM',
                        color: negahban1.hasFocus
                            ? Color(0xffF35383)
                            : Color(0xffC5C5C5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xffC5C5C5),
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xffF35383),
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    focusNode: negahban2,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'GM',
                        color: negahban2.hasFocus
                            ? Color(0xffF35383)
                            : Color(0xffC5C5C5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xffC5C5C5),
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xffF35383),
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => SwitchAccountScreen())));
                  },
                  child: Text('Sign in'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    negahban1.dispose();
    negahban2.dispose();
    super.dispose();
  }
}
