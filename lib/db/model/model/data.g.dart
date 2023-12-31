// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StdModelAdapter extends TypeAdapter<StdModel> {
  @override
  final int typeId = 1;

  @override
  StdModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StdModel(
      name: fields[1] as String,
      age: fields[2] as String,
      course: fields[3] as String,
      phone: fields[4] as String,
      index: fields[0] as int?,
      image: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StdModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.course)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StdModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
