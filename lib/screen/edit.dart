import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stdnlogn/db/model/functions/functions.dart';
import 'package:stdnlogn/db/model/model/data.dart';
import 'package:stdnlogn/screen/list.dart';

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
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _courseController = TextEditingController();
  final _phoneController = TextEditingController();
  //final _imagecontroller=ImagePicker();
  final _form = GlobalKey<FormState>();

  // File? _image;
  String? _imagepath;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _ageController.text = widget.age;
    _courseController.text = widget.course;
    _phoneController.text = widget.phone;
    _imagepath = widget.image != null ? widget.image : null;

    //_imagepath=widget.image ! = null ?File(widget.image) : null ;
  }

  void updatelist(int index) async {
    final stdntDB = await Hive.openBox<StdModel>('stdnt_db');
    if (index >= 0 && index < stdntDB.length) {
      final updatedstudent = StdModel(
        name: _nameController.text,
        age: _ageController.text,
        course: _courseController.text,
        phone: _phoneController.text,
        image: _imagepath,
      );

      await stdntDB.putAt(index, updatedstudent);
      await getAllstudent();

      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => home()));
    }
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
                        backgroundImage: _imagepath != null
                            ? FileImage(File(_imagepath!))
                            : const AssetImage('asset/avatar.png')
                                as ImageProvider),
                    onTap: () {
                      _pickImageCamera();
                    },
                  ),
                  GestureDetector(
                    child: ElevatedButton(
                        onPressed: () {
                          _pickImageGallery();
                        },
                        child: Text('Gallary')),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _nameController,
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
                    controller: _ageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Age',
                      prefixIcon: Icon(Icons.calendar_month_rounded),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _courseController,
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
                    controller: _phoneController,
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
                            MaterialPageRoute(builder: (context) => home()));
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

  _pickImageCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) {
      return;
    }
    setState(() {
      _imagepath = returnImage.path;
    });
  }

  _pickImageGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return;
    }
    setState(() {
      _imagepath = returnImage.path;
    });
  }
}
