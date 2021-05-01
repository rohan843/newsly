import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:news_app/custom_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
                      CircleAvatar(
                        backgroundColor: Color(0xFFBD3D3D),
                        radius: 38,
                        child: Icon(
                            CupertinoIcons.news,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Navigate',
                        style: TextStyle(
                          letterSpacing: 1.3,
                          color: Color(0xFFF6F6F6),
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                image: DecorationImage(
                  image: AssetImage('lib\\images\\background_header_2.1.jpg',),
                  fit: BoxFit.cover,
                ),
                ),
              ),
            ListTile(
              tileColor: Colors.grey[300],
              //selected: true,
              onTap: () {},
              leading: Icon(
                CupertinoIcons.news_solid,
                color: Colors.redAccent,
                size: 29,
              ),
              title: Text(
                  'Latest News',
              style: TextStyle(
                fontSize: 18.6,
              ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                CupertinoIcons.square_favorites_fill,
                color: Colors.blueGrey,
                size: 25,
              ),
              title: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 16.6,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                CupertinoIcons.heart_circle_fill,
                color: Colors.blueGrey,
                size: 25,
              ),
              title: Text(
                'Favourites',
                style: TextStyle(
                  fontSize: 16.6,
                ),
              ),
            ),
            Divider(
              thickness: 1.5,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 2, 0, 0),
              child: Text(
                  "Communicate",
                style: TextStyle(
                  fontSize: 15.1,
                  color: Colors.grey[800],
                  letterSpacing: 1.3,
                ),
              ),
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: TextButton.icon(
                    label: Text(
                      'Rate App!',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1.2,
                        color: Colors.grey,
                      ),
                    ),
                    icon: Icon(
                      CupertinoIcons.star,
                      color: Colors.grey,
                      size: 18.5,
                    ),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: TextButton.icon(
                    label: Text(
                      'Share',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1.2,
                        color: Colors.grey,
                      ),
                    ),
                    icon: Icon(
                      Icons.share_sharp,
                      color: Colors.grey,
                      size: 18.5,
                    ),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: TextButton.icon(
                    label: Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1.2,
                        color: Colors.grey,
                      ),
                    ),
                    icon: Icon(
                      CupertinoIcons.info_circle,
                      color: Colors.grey,
                      size: 18.5,
                    ),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: TextButton.icon(
                    label: Text(
                        'Privacy Policy',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1.2,
                        color: Colors.grey,
                      ),
                    ),
                    icon: Icon(
                      CupertinoIcons.shield_lefthalf_fill,
                      color: Colors.grey,
                      size: 18.5,
                    ),
                    onPressed: () => {},
                  ),
                ),
              ],
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
