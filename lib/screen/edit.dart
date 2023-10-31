import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:stdnlogn/db/model/functions/functions.dart';
import 'package:stdnlogn/db/model/model/data.dart';
import 'package:stdnlogn/screen/home.dart';


class Editpage extends StatefulWidget {
  final String name;
  final String age;
  final String Class;
  final String phone;
  final int index;
   final String image;

  Editpage({
    required this.name,
    required this.age,
    required this.Class,
    required this.phone,
    required this.index,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _imagecontroller=TextEditingController();
  final _form = GlobalKey<FormState>();

  File? _image; 

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _ageController.text = widget.age;
    _classController.text = widget.Class;
    _phoneController.text = widget.phone;
  // _image=Widget ._image ! = ''?File(widget.image);
  }

  void updatelist(int index) async {
    final stdntDB = await Hive.openBox<StdModel>('stdnt_db');
    if (index >= 0 && index < stdntDB.length) {
      final updatedstudent = StdModel(
        name: _nameController.text,
        age: _ageController.text,
        clas: _classController.text,
        address: _phoneController.text,
        image: _imagecontroller.text,
      );
      await stdntDB.putAt(index, updatedstudent);
      getAllstudent();

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => home()));
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
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {

                     },
                      icon: Icon(Icons.add_a_photo),
                    ),
                    radius: 60,
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
                    controller: _classController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Class',
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => home()));
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
}
