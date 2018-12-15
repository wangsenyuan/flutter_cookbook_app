import 'package:flutter/material.dart';

class GestureDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Gesture Demo';

    return MaterialApp(
      title: title,
      home: MyHomePage(
        title: title,
        parentContext: context,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final BuildContext parentContext;

  MyHomePage({Key key, this.title, this.parentContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: MyButton()),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(parentContext),
          child: Icon(Icons.arrow_back)),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Our GestureDetector wraps our button
    return GestureDetector(
      // When the child is tapped, show a snackbar
      onTap: () {
        final snackBar = SnackBar(content: Text("Tap"));

        Scaffold.of(context).showSnackBar(snackBar);
      },
      // Our Custom Button!
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text('My Button'),
      ),
    );
  }
}
