import 'package:flutter/material.dart';
import 'package:stdnlogn/db/model/functions/functions.dart';
import 'package:stdnlogn/screen/list.dart';
import 'package:stdnlogn/screen/view.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  
  Widget build(BuildContext context) {
     getAllstudent();
    
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('student login'),
          backgroundColor: Colors.purpleAccent,
          actions: [IconButton(onPressed:(){}, icon: Icon(Icons.search))],
        ),
        
        
        body: MyWidget(),
        
        floatingActionButton: FloatingActionButton.extended(onPressed:(){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Listpage(),));
           }, 
        label: Text('add stdnt'),icon:Icon(Icons.add),
        backgroundColor: Colors.purpleAccent),
      ),
    )  ;
          
      
  }
}