import 'dart:io';

import 'package:flutter/material.dart';



class details extends StatelessWidget {
 //
 final String name;
  final String age;
  final String Class;
  final String phone;
  final String image;

  const details({super.key,
    required this.name,
    required this.age,
    required this.Class,
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
   
      
    );
  }
}