import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stdnlogn/db/model/functions/functions.dart';
import 'package:stdnlogn/db/model/model/data.dart';
import 'package:stdnlogn/screen/list.dart';

class addpage extends StatefulWidget {
  addpage({super.key});

  @override
  State<addpage> createState() => _addpageState();
}

class _addpageState extends State<addpage> {
  final _namecontroller = TextEditingController();

  final _agecontroller = TextEditingController();

  final _coursecontroller = TextEditingController();

  final _phonecontroller = TextEditingController();

  final _form = GlobalKey<FormState>();

  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 21, 156, 177),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _form,
            child: Column(
              children: [
                GestureDetector(
                  child: CircleAvatar(
                      child: Icon(Icons.add_a_photo),
                      radius: 80,
                      backgroundImage: _image != null
                          ? FileImage(
                              _image!,
                            )
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
                    child: Text('Gallary'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 21, 156, 177),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _namecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Name',
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _agecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Age',
                    labelText: 'Age',
                    prefixIcon: Icon(Icons.calendar_month_rounded),
                  ),
                  maxLength: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _coursecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Course',
                    labelText: 'course',
                    prefixIcon: Icon(Icons.school),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _phonecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'phone number',
                    labelText: 'phone number',
                    prefix: Text("+91 "),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      _onaddstdclicked();
                      Navigator.of(context).pop(MaterialPageRoute(
                        builder: (context) => listpage(),
                      ));
                    }
                  },
                  icon: Icon(Icons.save),
                  label: Text('submit'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 21, 156, 177),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onaddstdclicked() async {
    final _name = _namecontroller.text.trim();
    final _age = _agecontroller.text.trim();
    final _course = _coursecontroller.text.trim();
    final _phone = _phonecontroller.text.trim();
    if (_name.isEmpty || _age.isEmpty || _course.isEmpty || _phone.isEmpty) {}
    print('$_name $_age $_course $_phone');

    final _Std = StdModel(
        name: _name,
        age: _age,
        course: _course,
        phone: _phone,
        image: _image!.path);

    addstudent(_Std);
  }

  _pickImage(ImageSource source) async {
    final returnImage = await ImagePicker().pickImage(source: source);
    if (returnImage == null) {
      return;
    }
    setState(() {
      _image = File(returnImage.path);
    });
  }
}
