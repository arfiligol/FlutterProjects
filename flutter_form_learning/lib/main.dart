import 'package:flutter/material.dart';
import 'package:flutter_form_learning/creating_forms_page.dart';
import 'package:flutter_form_learning/handling_changes_in_forms_page.dart';

void main() => runApp(const MyApp());

// Define MyApp Widget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

// Define a corresponding State class.
class _MyAppState extends State<MyApp> {
  // widget build part
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form Learning App",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade300),
      ),
      home: MyHomePage(),
    );
  }
}

// Define HomePage
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

// Define a corresponding State class.
class _MyHomePage extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const CreatingFormsPage();
        break;
      case 1:
        page = const HandlingChangesInFormsPage();
        break;
      default:
        throw UnimplementedError("No Widget Page for $selectedIndex");
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: const [
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text("Creating Forms")),
                  NavigationRailDestination(
                      icon: Icon(Icons.favorite), label: Text("Favorites")),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) => setState(() {
                  selectedIndex = value;
                }),
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
