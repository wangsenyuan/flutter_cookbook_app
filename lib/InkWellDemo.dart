import 'package:flutter/material.dart';

class InkWellDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'InkWell Demo';

    return MaterialApp(
      title: title,
      home: MyHomePage(title: title, parentContext: context),
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
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The InkWell Wraps our custom flat button Widget
    return InkWell(
      // When the user taps the button, show a snackbar
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Tap'),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text('Flat Button'),
      ),
    );
  }
}
