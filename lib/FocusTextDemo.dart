import 'package:flutter/material.dart';

class FocusTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Field Focus',
      home: FocusForm(
        parentContext: context,
      ),
    );
  }
}

// Define a Custom Form Widget
class FocusForm extends StatefulWidget {
  final BuildContext parentContext;

  FocusForm({Key key, this.parentContext}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class. This class will hold the data related to
// the form.
class _MyCustomFormState extends State<FocusForm> {
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method
  List<FocusNode> myFocusNodes;
  var index = 0;

  @override
  void initState() {
    super.initState();

    myFocusNodes = [FocusNode(), FocusNode()];
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed
    myFocusNodes.forEach((node) {
      node.dispose();
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Field Focus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // The first text field will be focused as soon as the app starts
            TextField(
              autofocus: true,
              focusNode: myFocusNodes[0],
            ),
            // The second text field will be focused when a user taps on the
            // FloatingActionButton
            TextField(
              focusNode: myFocusNodes[1],
            ),
            RaisedButton(
              child: Text('Press Me!'),
              onPressed: () {
                setState(() {
                  index = (index + 1) % 2;
                });
                FocusScope.of(context).requestFocus(myFocusNodes[index]);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the button is pressed, ask Flutter to focus our text field using
        // myFocusNode.
        onPressed: () => Navigator.pop(widget.parentContext),
        tooltip: 'Focus Second Text Field',
        child: Icon(Icons.arrow_back),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
