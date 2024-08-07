// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogsBoxAdapter extends TypeAdapter<BlogsBox> {
  @override
  final int typeId = 0;

  @override
  BlogsBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogsBox(
      jsonBlogsData: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BlogsBox obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.jsonBlogsData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogsBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
