// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_blog_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavBlogsBoxAdapter extends TypeAdapter<FavBlogsBox> {
  @override
  final int typeId = 1;

  @override
  FavBlogsBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavBlogsBox(
      id: fields[0] as String?,
      title: fields[1] as String?,
      imgUrl: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FavBlogsBox obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.imgUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavBlogsBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
