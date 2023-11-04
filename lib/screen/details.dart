
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 19, 155, 165),
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: FileImage(File(widget.image)),
                  radius: 80,
                ),
                SizedBox(height: 20),
                ProfileCard(
                  title: 'Name',
                  content: widget.name,
                ),
                ProfileCard(
                  title: 'Age',
                  content: widget.age,
                ),
                ProfileCard(
                  title: 'Course',
                  content: widget.course,
                ),
                ProfileCard(
                  title: 'Phone',
                  content: widget.phone,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String title;
  final String content;

  const ProfileCard({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white, 
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 19, 155, 165), 
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 19, 155, 165) 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
