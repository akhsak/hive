import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stdnlogn/db/model/functions/functions.dart';
import 'package:stdnlogn/db/model/model/data.dart';
import 'package:stdnlogn/screen/details.dart';
import 'package:stdnlogn/screen/edit.dart';
import 'package:stdnlogn/screen/list.dart';



class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  //search//
  String _search='';
  List<StdModel> searchlist=[];
  List<StdModel> studlist=[];

   Future<void> allstud()async{
    final allstud = getAllstudent();
    stdListNotifier.value=allstud;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchresult();
    allstud();
  }

  void searchresult(){
    setState(() {
      searchlist=stdListNotifier.value.where(
        (StudentModel) =>StudentModel.name.toLowerCase()
        .contains(_search.toLowerCase())).toList();
    });

  }
  @override
  
  Widget build(BuildContext context) {
     //getAllstudent();
      
    return Scaffold(
      appBar: AppBar(
        title: Text('student login'),
        backgroundColor: Color.fromARGB(255, 21, 156, 177),
       // actions: [IconButton(onPressed:(){}, icon: Icon(Icons.search))],
      ),
       body:Container(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(20),
            
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
                  _search=value;
                });
                searchresult();
              },
            ),),

            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: stdListNotifier,
                  builder: (BuildContext context, List<StdModel> stdList, 
                  Widget? child) {
                    final displyedstudents=searchlist.isNotEmpty ?searchlist:stdList;
                    return ListView.separated(
                      itemBuilder: (context, index) {
              final data = displyedstudents[index];
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>detailspage(
                    name: data.name, 
                    age:data.age, 
                    Clss:data.clas, 
                    phone: data.address, 
                    image: data.image!)));
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
                            Clss:data.clas,
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
                      itemCount: searchlist.length,
                    );
                  }
                ),
            ),
  
        FloatingActionButton.extended(onPressed:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Listpage(),));
         }, 
      label: Text('add stdnt'),icon:Icon(Icons.add),
      backgroundColor: Color.fromARGB(255, 21, 156, 177),
      ),

          ],
        ),
       )
  
    );       
      
  }
}