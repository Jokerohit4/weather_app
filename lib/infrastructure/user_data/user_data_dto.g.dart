// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataDTOAdapter extends TypeAdapter<UserDataDTO> {
  @override
  final int typeId = 1;

  @override
  UserDataDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDataDTO(
      isLoggedIn: fields[0] as bool,
      user: fields[1] as User,
    );
  }

  @override
  void write(BinaryWriter writer, UserDataDTO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isLoggedIn)
      ..writeByte(1)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
