// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsermodelAdapter extends TypeAdapter<Usermodel> {
  @override
  final int typeId = 1;

  @override
  Usermodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Usermodel(
      name: fields[0] as String?,
      email: fields[1] as String?,
      password: fields[2] as String?,
      image: fields[4] as String?,
      phonenumber: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Usermodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.phonenumber)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsermodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
