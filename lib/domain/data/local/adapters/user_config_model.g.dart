// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_config_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserConfigAdapter extends TypeAdapter<UserConfig> {
  @override
  final int typeId = 2;

  @override
  UserConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserConfig(
      isDarkMode: fields[0] as bool?,
      isNotificationsEnabled: fields[1] as bool?,
      language: fields[2] as String?,
      authenticated: fields[3] as bool?,
      githubToken: fields[4] as String?,
      isSteamPassEnabled: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UserConfig obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.isDarkMode)
      ..writeByte(1)
      ..write(obj.isNotificationsEnabled)
      ..writeByte(2)
      ..write(obj.language)
      ..writeByte(3)
      ..write(obj.authenticated)
      ..writeByte(4)
      ..write(obj.githubToken)
      ..writeByte(5)
      ..write(obj.isSteamPassEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
