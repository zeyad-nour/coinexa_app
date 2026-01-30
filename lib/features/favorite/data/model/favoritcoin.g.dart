// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favoritcoin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelFavoritcoinAdapter extends TypeAdapter<ModelFavoritcoin> {
  @override
  final int typeId = 1;

  @override
  ModelFavoritcoin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelFavoritcoin(
      fields[0] as String,
      fields[1] as double,
      fields[2] as String,
      fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ModelFavoritcoin obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.namecoin)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.rate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelFavoritcoinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
