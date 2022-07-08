import 'package:arashi/Controller/practice_view_controller.dart';
import 'package:arashi/Model/phrase_data_model.dart';
import 'package:flutter/material.dart';

class PracticeView extends StatefulWidget {
  const PracticeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PracticeViewState();
}

class _PracticeViewState extends State<PracticeView> {
  bool _showAppBar = true;
  Future<List<PhraseDataModel>> data = PracticeViewController.getData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _showAppBar ? AppBar() : null,
        body: GestureDetector(
            onDoubleTap: (() {
              setState(() {
                _showAppBar = !_showAppBar;
              });
            }),
            child: AbsorbPointer(
                child: Center(
              child: FutureBuilder(
                future: data,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<PhraseDataModel> snapshotData = snapshot.data;
                    return PageView.builder(
                      itemCount: snapshotData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(index.toString());
                      },
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ))));
  }
}
