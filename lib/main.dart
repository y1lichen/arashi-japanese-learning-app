import 'package:flutter/material.dart';
import 'package:arashi/View/add_phrase_popup_sheet_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arashi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'あらし'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showAddPhrasePopup(context) {
    showDialog(
        context: context,
        builder: (BuildContext bc) {
          return const AddPhrasePopupSheetView();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        centerTitle: false,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 45,
        actions: [
          IconButton(
              onPressed: () {
                _showAddPhrasePopup(context);
              },
              tooltip: "add a new phrase",
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[Text("Test")]),
      ),
    );
  }
}
