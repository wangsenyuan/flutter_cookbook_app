import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  final String title;

  DrawerDemo({Key key, this.title = "Drawer Demo"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: Builder(
          builder: (context) => IconButton(
                icon: new Icon(Icons.settings),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      ),
      body: Center(child: Text('My Page!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Make sure we call setState! This will tell Flutter to rebuild the
          // UI with our changes!
          Navigator.pop(context);
        },
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.arrow_back),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
