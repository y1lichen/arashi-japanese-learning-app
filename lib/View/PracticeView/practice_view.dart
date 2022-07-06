import 'package:arashi/Controller/practice_view_controller.dart';
import 'package:flutter/material.dart';

class PracticeView extends StatefulWidget {
  const PracticeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PracticeViewState();
}

class _PracticeViewState extends State<PracticeView> {
  bool _showAppBar = true;
  final PracticeViewController _controller = PracticeViewController();

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
            future: _controller.data,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                return const CircularProgressIndicator();
              }
            },
          ))),
        ));
  }
}
