// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objects.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectAdapter extends TypeAdapter<Project> {
  @override
  final int typeId = 0;

  @override
  Project read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Project(
      fields[0] as DateTime,
      fields[1] as DateTime,
      fields[2] as String,
      fields[3] as Repo,
      fields[4] as String,
      fields[5] as Device,
    );
  }

  @override
  void write(BinaryWriter writer, Project obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.dateCreated)
      ..writeByte(1)
      ..write(obj.dateModified)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.repo)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.device);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RepoAdapter extends TypeAdapter<Repo> {
  @override
  final int typeId = 1;

  @override
  Repo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Repo(
      fields[0] as String,
      fields[1] as String,
      sshDevice: fields[2] as SSHDevice?,
    );
  }

  @override
  void write(BinaryWriter writer, Repo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.sshDevice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SSHDeviceAdapter extends TypeAdapter<SSHDevice> {
  @override
  final int typeId = 2;

  @override
  SSHDevice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SSHDevice(
      fields[0] as String,
      fields[1] as String,
      port: fields[2] == null ? 22 : fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SSHDevice obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ip)
      ..writeByte(1)
      ..write(obj.pswd)
      ..writeByte(2)
      ..write(obj.port);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SSHDeviceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DeviceAdapter extends TypeAdapter<Device> {
  @override
  final int typeId = 3;

  @override
  Device read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Device(
      fields[0] as String,
      fields[2] as DeviceModel,
      sshDevice: fields[1] as SSHDevice?,
    );
  }

  @override
  void write(BinaryWriter writer, Device obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.sshDevice)
      ..writeByte(2)
      ..write(obj.model);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DeviceModelAdapter extends TypeAdapter<DeviceModel> {
  @override
  final int typeId = 4;

  @override
  DeviceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeviceModel(
      fields[0] as SBCModels,
      diagram: fields[1] as DeviceDiagram?,
    );
  }

  @override
  void write(BinaryWriter writer, DeviceModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.diagram);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DeviceDiagramAdapter extends TypeAdapter<DeviceDiagram> {
  @override
  final int typeId = 5;

  @override
  DeviceDiagram read(BinaryReader reader) {
    return DeviceDiagram();
  }

  @override
  void write(BinaryWriter writer, DeviceDiagram obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceDiagramAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SBCModelsAdapter extends TypeAdapter<SBCModels> {
  @override
  final int typeId = 6;

  @override
  SBCModels read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SBCModels.rpi3Bp;
      case 1:
        return SBCModels.rpi4;
      case 2:
        return SBCModels.rpiPico;
      default:
        return SBCModels.rpi3Bp;
    }
  }

  @override
  void write(BinaryWriter writer, SBCModels obj) {
    switch (obj) {
      case SBCModels.rpi3Bp:
        writer.writeByte(0);
        break;
      case SBCModels.rpi4:
        writer.writeByte(1);
        break;
      case SBCModels.rpiPico:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SBCModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
