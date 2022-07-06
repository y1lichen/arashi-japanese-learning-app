import 'package:arashi/View/HomePage/home_page_list_view.dart';
import 'package:arashi/View/PracticeView/practice_view.dart';
import 'package:arashi/View/add_phrase_popup_sheet_view.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  HomePageView({Key? key, required this.title}) : super(key: key);

  final String title;
  final GlobalKey<HomePageListViewState> homeListViewKey =
      GlobalKey<HomePageListViewState>();

  @override
  State<HomePageView> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageView> {
  void _showAddPhrasePopup(context) {
    showDialog(
        context: context,
        builder: (BuildContext bc) {
          return AddPhrasePopupSheetView(widget.homeListViewKey);
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
        child: HomePageListView(
          key: widget.homeListViewKey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PracticeView()));
        },
      ),
    );
  }
}
