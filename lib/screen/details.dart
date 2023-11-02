 import 'dart:io';

import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  final String age;
  final String course;
  final String phone;
  final String image;

  const DetailsPage({
    Key? key,
    required this.name,
    required this.age,
    required this.course,
    required this.phone,
    required this.image,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      
      body:
       SingleChildScrollView(
         child: Center(
          
          child: Container(
            margin: EdgeInsets.all(90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                 backgroundColor: Colors.cyan,
                  radius: 70,
                  child: CircleAvatar(
                    backgroundImage: FileImage(File(widget.image!)),
                    radius: 90,
                  ),
              ),
              
                SizedBox(height: 20), 
       
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Name: ${widget.name}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Age: ${widget.age}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Course: ${widget.course}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Phone: ${widget.phone}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),           
              ],          
         ),
         ),
              ),
       ),
     );
  }
 }

