import 'package:flutter/material.dart';
import 'package:stdnlogn/db/model/functions/functions.dart';
import 'package:stdnlogn/db/model/model/data.dart';
import 'package:stdnlogn/screen/edit.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: stdListNotifier,
      builder: (BuildContext context, List<StdModel> stdList, Widget? child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = stdList[index];
            return ListTile(
              title: Text(data.name),
              subtitle: Text(data.age),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>Editpage(
                            name: data.name,
                           age: data.age,
                           Class:data.clas,
                            phone: data.address, 
                            index: index,
                          //  image: data.image
                           )
                      ));
                    },
                    icon: Icon(Icons.edit, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      deleteStudent(index);
                    },
                    icon: Icon(Icons.delete, color: Color.fromARGB(255, 106, 52, 47)),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: stdList.length,
        );
      },
    );
  }
}
