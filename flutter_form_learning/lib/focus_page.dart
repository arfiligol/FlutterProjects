import 'package:flutter/material.dart';

//
class FocusLearningPage extends StatefulWidget {
  const FocusLearningPage({super.key});

  @override
  _FocusLearningPage createState() => _FocusLearningPage();
}

class _FocusLearningPage extends State<FocusLearningPage> {
  // Since focus nodes are long-lived objects, manage the lifecycle using a State object.
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  // Build Widget
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const TextField(
            autofocus: true,
          ),
          TextField(
            autofocus: true,
            focusNode: myFocusNode,
          ),
          FloatingActionButton(
            onPressed: () => myFocusNode.requestFocus(),
            tooltip: 'Focus Second Text Field',
            child: const Icon(Icons.edit),
          )
        ],
      ),
    );
  }
}
