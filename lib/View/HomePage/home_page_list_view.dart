import 'package:arashi/Controller/home_page_view__controller.dart';
import 'package:arashi/Model/phrase_data_model.dart';
import 'package:flutter/material.dart';

class HomePageListView extends StatefulWidget {
  const HomePageListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageListViewState();
}

class HomePageListViewState extends State<HomePageListView> {
  late Future<List<PhraseDataModel>> data;

  final HomePageListViewController _controller = HomePageListViewController();

  Future<void> addData(PhraseDataModel model) async {
    setState(() {
      data = HomePageListViewController.appendElements(data, model);
    });
  }

  @override
  void initState() {
    data = _controller.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
      future: data,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else if (snapshot.data.length == 0) {
          return const Text(
            "No data.",
            style: TextStyle(fontSize: 18),
          );
        } else {
          List<PhraseDataModel> data = snapshot.data;
          return ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(data[index].phrase),
                subtitle: Text(data[index].meaning),
              );
            },
          );
        }
      },
    ));
  }
}
