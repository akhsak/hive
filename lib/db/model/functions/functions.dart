import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:stdnlogn/db/model/model/data.dart';
import 'package:stdnlogn/screen/edit.dart';

ValueNotifier<List<StdModel>> stdListNotifier = ValueNotifier([]);

Future<void> addstudent(StdModel value) async {
  final stdntDB = await Hive.openBox<StdModel>('stdnt_db');
  await stdntDB.add(value);

  stdListNotifier.value.add(value);
  stdListNotifier.notifyListeners();
}

getAllstudent() async {
  final stdntDB = await Hive.openBox<StdModel>('stdnt_db');
  stdListNotifier.value.clear();

  stdListNotifier.value.addAll(stdntDB.values);
  stdListNotifier.notifyListeners();
}

Future<void> deleteStudent(int index) async {
  final stdntDB = await Hive.openBox<StdModel>('stdnt_db');
  await stdntDB.deleteAt(index);
  getAllstudent();
}

void updatelist(int index) async {
  final stdntDB = await Hive.openBox<StdModel>('stdnt_db');
    final updatedstudent = StdModel(
      name: nameController.text,
      age: ageController.text,
      course: courseController.text,
      phone: phoneController.text,
      image: imagepath,
    );

    await stdntDB.putAt(index, updatedstudent);
    await getAllstudent();
  }
