import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:stdnlogn/db/model/model/data.dart';


ValueNotifier<List<StdModel>>stdListNotifier=ValueNotifier([]);

Future<void> addstudent(StdModel value)async{
 
 final stdntDB=await Hive.openBox<StdModel>('stdnt_db');
 await stdntDB.add(value);
 
stdListNotifier.value.add(value);
stdListNotifier.notifyListeners();
}
 getAllstudent() async{
  final stdntDB=await Hive.openBox<StdModel>('stdnt_db');
  stdListNotifier.value.clear();

  stdListNotifier.value.addAll(stdntDB.values);
  stdListNotifier.notifyListeners();
}
Future<void> deleteStudent(int index)async{
final stdntDB=await Hive.openBox<StdModel>('stdnt_db');
 await stdntDB.delete(index);
getAllstudent();
}

Future<void> editstudent( data, StdModel updated)async{
final stdntDB=await Hive.openBox<StdModel>('stdnt_db');
// stdListNotifier.value.clear();
//  stdListNotifier.value.addAll(stdntDB.values);
//   stdListNotifier.notifyListeners();
//   stdntDB.putAt(data, updated);
//   getAllstudent();
}


