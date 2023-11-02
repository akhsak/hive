import 'dart:io';

import 'package:flutter/material.dart';

class detailspage extends StatelessWidget {
  final String name;
  final String age;
  final String Clss;
  final String phone;
  final String image;

  const detailspage({
    super.key,
    required this.name,
    required this.age,
    required this.Clss,
    required this.phone,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('profile'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(150),
          child: Column(
            children: [
              
              
              Text(name),


              Text(age),


              Text(Clss),


               Text(phone)],
          ),
        ),
        
      ),
    );
  }
}
