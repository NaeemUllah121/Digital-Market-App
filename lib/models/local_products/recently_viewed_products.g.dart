// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_viewed_products.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalProductsAdapter extends TypeAdapter<LocalProducts> {
  @override
  final int typeId = 1;

  @override
  LocalProducts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalProducts()
      ..id = fields[0] as String?
      ..name = fields[1] as String?
      ..shopImage = fields[2] as String?
      ..shopUrl = fields[3] as String?
      ..description = fields[4] as String?
      ..productImages = (fields[5] as List?)?.cast<dynamic>()
      ..category = (fields[6] as List?)?.cast<dynamic>()
      ..bannerImage = fields[7] as String?
      ..price = fields[8] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalProducts obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.shopImage)
      ..writeByte(3)
      ..write(obj.shopUrl)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.productImages)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.bannerImage)
      ..writeByte(8)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
