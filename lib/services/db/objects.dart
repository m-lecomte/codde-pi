import 'package:hive/hive.dart';

part 'objects.g.dart';

@HiveType(typeId: 0)
class Project extends HiveObject {
  @HiveField(0)
  DateTime dateCreated;

  @HiveField(1)
  DateTime dateModified;

  @HiveField(2)
  String name;

  @HiveField(3)
  Repo repo;

  @HiveField(4)
  String description;

  @HiveField(5)
  Device device;

  Project(this.dateCreated, this.dateModified, this.name, this.repo, this.description, this.device);

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'date_created': dateCreated,
      'name': name,
      'description': description,
      'path': repo.toMap(),
    };
  }
}

@HiveType(typeId: 1)
class Repo extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String path;


  @HiveField(2, defaultValue: null)
  SSHDevice? sshDevice;
  
  Repo(this.name, this.path, {this.sshDevice});

  Map<String, dynamic> toMap() {
    return {};
  }
}

@HiveType(typeId: 2)
class SSHDevice extends HiveObject {
  @HiveField(0)
  String ip;

  @HiveField(1)
  String pswd;

  @HiveField(2, defaultValue: 22)
  int? port;

  SSHDevice(this.ip, this.pswd, {this.port});
}

@HiveType(typeId: 3)
class Device extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1, defaultValue: null)
  SSHDevice? sshDevice;

  @HiveField(2)
  DeviceModel model;

  Device(this.name, this.model, {this.sshDevice});
}

@HiveType(typeId: 4)
class DeviceModel extends HiveObject {
  @HiveField(0)
  SBCModels name;

  @HiveField(1)
  DeviceDiagram? diagram;

  DeviceModel(this.name, {this.diagram});
}


// TODO: Match with DeviceDiagram, not yet implemented
@HiveType(typeId: 5)
class DeviceDiagram extends HiveObject {
}

@HiveType(typeId: 6)
enum SBCModels {
  @HiveField(0)
  rpi3Bp,

  @HiveField(1)
  rpi4,

  @HiveField(2)
  rpiPico,
}