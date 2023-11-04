import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stdnlogn/db/model/functions/functions.dart';
import 'package:stdnlogn/db/model/model/data.dart';
import 'package:stdnlogn/screen/list.dart';


  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final courseController = TextEditingController();
  final phoneController = TextEditingController();
  final _form = GlobalKey<FormState>();
  String? imagepath;

class Editpage extends StatefulWidget {
  final String name;
  final String age;
  final String course;
  final String phone;
  final int index;
  final image;

  Editpage({
    required this.name,
    required this.age,
    required this.course,
    required this.phone,
    required this.index,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  
  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    ageController.text = widget.age;
    courseController.text = widget.course;
    phoneController.text = widget.phone;
    imagepath = widget.image != null ? widget.image : null;

  }

 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 21, 156, 177)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                        child: Icon(Icons.add_a_photo),
                        radius: 60,
                        backgroundImage: imagepath != null
                            ? FileImage(File(imagepath!))
                            : const AssetImage('asset/avatar.png')
                                as ImageProvider),
                    onTap: () {
                      _pickImage(ImageSource.camera);
                    },
                  ),
                  GestureDetector(
                    child: ElevatedButton(
                        onPressed: () {
                          _pickImage(ImageSource.gallery);
                        },
                        child: Text('Gallary')),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: ageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Age',
                      prefixIcon: Icon(Icons.calendar_month_rounded),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: courseController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Course',
                      prefixIcon: Icon(Icons.class_sharp),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: phoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Phone number',
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        updatelist(widget.index);
                        Navigator.of(context).pop(
                            MaterialPageRoute(builder: (context) => listpage()));
                      }
                    },
                    icon: Icon(Icons.save),
                    label: Text('update'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _pickImage(ImageSource source) async {
    final returnImage =
        await ImagePicker().pickImage(source: source
        );
    if (returnImage == null) {
      return;
    }
    setState(() {
      imagepath = returnImage.path;
    });
  }

  // _pickImageGallery() async {
  //   final returnImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (returnImage == null) {
  //     return;
  //   }
  //   setState(() {
  //     imagepath = returnImage.path;
  //   });
  }

