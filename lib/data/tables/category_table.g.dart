// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryTableAdapter extends TypeAdapter<CategoryTable> {
  @override
  final int typeId = 0;

  @override
  CategoryTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryTable(
      id: fields[0] as String,
      title: fields[1] as String,
      desc: fields[2] as String,
      background: fields[3] as String,
      order: fields[4] as int,
      lock: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryTable obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.background)
      ..writeByte(4)
      ..write(obj.order)
      ..writeByte(5)
      ..write(obj.lock);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
