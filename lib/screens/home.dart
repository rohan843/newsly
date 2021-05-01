import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search_sharp), onPressed: () {})
        ],
        backgroundColor: Colors.redAccent,
        title: Text(
          "Latest News",
          style: TextStyle(

          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Center(
                  child: Column(
                    children: [
                      Icon(
                          CupertinoIcons.news,
                        color: Colors.white,
                        size: 60,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Navigate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                ),
              ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Text("Home screen"),
      )
    );
  }
}
