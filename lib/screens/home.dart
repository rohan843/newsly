import 'package:flutter/material.dart';

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
            Stack(
              children: [
                DrawerHeader(
                  child: Center(child: Text('Header Area')),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://media.nbcwashington.com/2021/02/globes-nom-2021.jpg?resize=1200,675'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              ]
            )
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
