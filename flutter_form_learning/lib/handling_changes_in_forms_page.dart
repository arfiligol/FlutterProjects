import 'package:flutter/material.dart';

class HandlingChangesInFormsPage extends StatefulWidget {
  const HandlingChangesInFormsPage({super.key});

  @override
  State<HandlingChangesInFormsPage> createState() =>
      _HandlingChangesInFormsPageState();
}

// Define a corresponding State class.
// This class hodls data related to the Form.
class _HandlingChangesInFormsPageState
    extends State<HandlingChangesInFormsPage> {
  // create a text controller. Later, use it to retrieve the
  // current value of the TextField.
  final myController = TextEditingController();

  // Methods
  void _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  // What to do when the object is initiated
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  // What to do when the object is disposed
  @override
  void dispose() {
    // clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Retrieve Text Input."),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text that user has entered by using the
                  // TextEditingController.
                  content: Text(myController.text),
                );
              });
        },
        tooltip: "Show me the value!",
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
