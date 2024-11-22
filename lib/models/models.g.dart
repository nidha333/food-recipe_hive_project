// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodRecipeAdapter extends TypeAdapter<FoodRecipe> {
  @override
  final int typeId = 0;

  @override
  FoodRecipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodRecipe(
      itemName: fields[0] as String?,
      category: fields[1] as String?,
      addIngreadents: fields[2] as String?,
      amound: fields[3] as String?,
      image: fields[5] as String?,
      step: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodRecipe obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.itemName)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.addIngreadents)
      ..writeByte(3)
      ..write(obj.amound)
      ..writeByte(4)
      ..write(obj.step)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodRecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
