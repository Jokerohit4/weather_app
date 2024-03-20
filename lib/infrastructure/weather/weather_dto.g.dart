// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherDTOAdapter extends TypeAdapter<WeatherDTO> {
  @override
  final int typeId = 0;

  @override
  WeatherDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherDTO(
      temperature: fields[0] as double,
      humidity: fields[1] as int,
      windSpeed: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherDTO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.temperature)
      ..writeByte(1)
      ..write(obj.humidity)
      ..writeByte(2)
      ..write(obj.windSpeed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
