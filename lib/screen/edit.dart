import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:stdnlogn/db/model/functions/functions.dart';
import 'package:stdnlogn/db/model/model/data.dart';
import 'package:stdnlogn/screen/view.dart';

class Editpage extends StatefulWidget {
  final String name;
  final String age;
  final String Class;
  final String phone;
  final int index;
  // final dynamic image;

  Editpage({
    required this.name,
    required this.age,
    required this.Class,
    required this.phone,
    required this.index,
    // required this.image,
    Key? key,
  }) : super(key: key);

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    ageController.text = widget.age;
    classController.text = widget.Class;
    addressController.text = widget.phone;
  }

  void updatelist(int index) async {
    final stdntDB = await Hive.openBox<StdModel>('stdnt_db');
    if (index >= 0 && index < stdntDB.length) {
      final updatedstudent = StdModel(
        name: nameController.text,
        age: ageController.text,
        clas: classController.text,
        address: addressController.text,
      );
      await stdntDB.putAt(index, updatedstudent);
      getAllstudent();

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MyWidget()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      // Implement image picker here
                    },
                    icon: Icon(Icons.add_a_photo),
                  ),
                  radius: 60,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value is empty';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: classController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Class',
                    prefixIcon: Icon(Icons.class_sharp),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: addressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Phone number',
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      updatelist(widget.index);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyWidget()));
                    }
                  },
                  icon: Icon(Icons.save),
                  label: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
