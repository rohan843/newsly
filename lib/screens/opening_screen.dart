import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpeningScreen extends StatefulWidget {
  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x9CFF5252),
      bottomNavigationBar: BottomAppBar(
        color: Color(0x379E9E9E),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  'Developed and Maintained by @rohan843',
                  style: TextStyle(
                    color: Colors.white60
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib\\images\\opening_bg_1.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Stack(
          children: [
            BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 7,
                  sigmaY: 7,
                ),
              child: Container(
                color: Colors.red.withOpacity(0.4),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      CupertinoIcons.news,
                    color: Colors.white,
                    size: 150,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Newsly',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontFamily: 'lib/fonts/Courgette-Regular.ttf',
                      letterSpacing: 3
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
}

