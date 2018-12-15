import 'package:flutter/material.dart';

class RetrieveTextContentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: _MyCustomForm(parentContext: context),
    );
  }
}

// Define a Custom Form Widget
class _MyCustomForm extends StatefulWidget {
  final BuildContext parentContext;

  _MyCustomForm({Key key, this.parentContext}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class. This class will hold the data related to
// our Form.
class _MyCustomFormState extends State<_MyCustomForm> {
  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: myController,
              ),
              RaisedButton(
                  child: Text("Show me the value!"),
                  onPressed: () {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the user has typed in using our
                          // TextEditingController
                          content: Text(myController.text),
                        );
                      },
                    );
                  })
            ],
          )),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog with the
        // text the user has typed into our text field.
        onPressed: () => Navigator.pop(widget.parentContext),
        tooltip: 'back!',
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
