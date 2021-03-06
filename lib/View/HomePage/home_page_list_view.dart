import 'package:arashi/Controller/home_page_list_view__controller.dart';
import 'package:arashi/Model/phrase_data_model.dart';
import 'package:arashi/View/edit_list_item_view.dart';
import 'package:flutter/material.dart';

class HomePageListView extends StatefulWidget {
  final Function(int) setDataLength;
  const HomePageListView({Key? key, required this.setDataLength})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageListViewState();
}

class HomePageListViewState extends State<HomePageListView> {
  late Future<List<PhraseDataModel>> data;

  void setDataLength() async {
    final list = await data;
    widget.setDataLength(list.length);
  }

  Future<void> addData(PhraseDataModel model) async {
    setState(() {
      data = HomePageListViewController.appendElements(data, model);
    });
    setDataLength();
  }

  Future<void> updateData(PhraseDataModel newModel) async {
    setState(() {
      data = HomePageListViewController.updateAndGetNewData(data, newModel);
    });
  }

  Future<void> deleteData(PhraseDataModel model) async {
    setState(() {
      data = HomePageListViewController.deleteAndGetData(data, model);
    });
    setDataLength();
  }

  @override
  void initState() {
    data = HomePageListViewController.fetchData();
    setDataLength();
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
              PhraseDataModel model = data[index];
              return Dismissible(
                key: Key(model.id.toString()),
                background: Container(
                  color: Colors.red,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // set only swipe from left to right
                direction: DismissDirection.startToEnd,
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    deleteData(model);
                    return true;
                  }
                  return false;
                },
                child: ListTile(
                  title:
                      model.kanji == "" ? Text(model.kana) : Text(model.kanji!),
                  subtitle: Text(model.meaning),
                  trailing: const Icon(Icons.arrow_right_sharp),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditListItemView(
                                  model: model,
                                  updateDataInView: updateData,
                                )));
                  },
                ),
              );
            },
          );
        }
      },
    ));
  }
}
