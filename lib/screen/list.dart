import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stdnlogn/db/model/functions/functions.dart';
import 'package:stdnlogn/db/model/model/data.dart';
import 'package:stdnlogn/screen/details.dart';
import 'package:stdnlogn/screen/edit.dart';
import 'package:stdnlogn/screen/addstd.dart';

class listpage extends StatefulWidget {
  const listpage({super.key});

  @override
  State<listpage> createState() => _listpageState();
}

class _listpageState extends State<listpage> {
  //search//
  String _search = '';
  List<StdModel> searchlist = [];
  List<StdModel> studlist = [];

  Future<void> allstud() async {
    final allstud = getAllstudent();
    stdListNotifier.value = allstud;
  }

  @override
  void initState() {
    super.initState();
    searchresult();
    allstud();
  }

  void searchresult() {
    setState(() {
      searchlist = stdListNotifier.value
          .where((StudentModel) =>
              StudentModel.name.toLowerCase().contains(_search.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    getAllstudent();

    return Scaffold(
        appBar: AppBar(
          title: Text('student login'),
          backgroundColor: Color.fromARGB(255, 21, 156, 177),
          elevation: 0,
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'search',
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _search = value;
                    });
                    searchresult();
                  },
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: stdListNotifier,
                    builder: (BuildContext context, List<StdModel> stdList,
                        Widget? child) {
                      final displyedstudents =
                          searchlist.isNotEmpty ? searchlist : stdList;
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          final data = displyedstudents[index];
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Card(
                              elevation: 8,
                              color: Color.fromARGB(255, 228, 226, 226),
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                          name: data.name,
                                          age: data.age,
                                          course: data.course,
                                          phone: data.phone,
                                          image: data.image!)));
                                },
                                leading: CircleAvatar(
                                    backgroundImage: data.image != null
                                        ? FileImage(File(data.image!))
                                        : AssetImage('asset/avatar.png')
                                            as ImageProvider),
                                title: Text(data.name),
                                subtitle: Text(data.age),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => Editpage(
                                                      name: data.name,
                                                      age: data.age,
                                                      course: data.course,
                                                      phone: data.phone,
                                                      index: index,
                                                      image: data.image!,
                                                    )));
                                      },
                                      icon: Icon(Icons.edit, color: Colors.black),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        deleteStudent(index);
                                      },
                                      icon: Icon(Icons.delete,
                                          color: Color.fromARGB(255, 106, 52, 47)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: displyedstudents.length,
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15,
                ),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => addpage(),
                    ));
                  },
                  label: Text('add student'),
                  icon: Icon(Icons.add),
                  backgroundColor: Color.fromARGB(255, 21, 156, 177),
                ),
              ),
            ],
          ),
        ));
  }
}
