import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stdnlogn/db/model/functions/functions.dart';
import 'package:stdnlogn/db/model/model/data.dart';
import 'package:stdnlogn/screen/details.dart';
import 'package:stdnlogn/screen/edit.dart';
import 'package:stdnlogn/screen/list.dart';
import 'package:stdnlogn/screen/details.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  
  Widget build(BuildContext context) {
     getAllstudent();
      
    return Scaffold(
      appBar: AppBar(
        title: Text('student login'),
        backgroundColor: Color.fromARGB(255, 21, 156, 177),
        actions: [IconButton(onPressed:(){}, icon: Icon(Icons.search))],
      ),
       body: ValueListenableBuilder(
      valueListenable: stdListNotifier,
      builder: (BuildContext context, List<StdModel> stdList, Widget? child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = stdList[index];
            return ListTile(
              
              onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>details();

              ));
              },
              leading: CircleAvatar(
                 backgroundImage: data.image!=null?
              FileImage(File(data.image!)):AssetImage('asset/avatar.png') as ImageProvider
                
              ),
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
                          image: data.image!,
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
      }
    ),
  
  floatingActionButton: FloatingActionButton.extended(onPressed:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Listpage(),));
         }, 
      label: Text('add stdnt'),icon:Icon(Icons.add),
      backgroundColor: Color.fromARGB(255, 21, 156, 177),
      ),
    );       
      
  }
}