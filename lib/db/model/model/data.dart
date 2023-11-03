import 'package:hive_flutter/adapters.dart';
part 'data.g.dart';

@HiveType(typeId: 1)
class StdModel {
  @HiveField(0)
  int? index;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String course;

  @HiveField(4)
  final String phone;

  @HiveField(5)
  final String? image;

  StdModel(
      {required this.name,
      required this.age,
      required this.course,
      required this.phone,
      this.index,
      this.image});
}
