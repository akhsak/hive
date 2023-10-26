
import 'package:hive_flutter/adapters.dart';
part 'data.g.dart';

@HiveType(typeId:1)

class StdModel {
   @HiveField(0) 
    int? index;

   @HiveField(1) 
  final String name;

   @HiveField(2) 
  final String age;

   @HiveField(3) 
  final String clas;

   @HiveField(4) 
  final String address;

  StdModel({required this.name, 
  required this.age,
  required this.clas,
  required this.address,
  this.index});
  
}