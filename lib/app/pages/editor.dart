import 'package:codde_pi/app/dialogs/myp.dart';
import 'package:codde_pi/services/db/objects.dart';
import 'package:codde_pi/services/editor/highlighter.dart';
import 'package:codde_pi/services/editor/input.dart';
import 'package:codde_pi/core/components/view.dart';
import 'package:codde_pi/services/view_models.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
class Editor extends StatefulWidget {
  const Editor({super.key, this.path = ''});
  final String path;
  @override
  _Editor createState() => _Editor();
}

class _Editor extends State<Editor> {
  late DocumentProvider doc;
  var string = "";
  var isNull = true;

  @override
  void initState() {
    doc = DocumentProvider();
    doc.openFile(widget.path);
    // callDB();
    var box = Hive.box<Project>('projects');
    var projectTest = Project(DateTime.now(), DateTime.now(), 'test',
        Repo('local', '~'),
        'this is a test',
        Device(
            'Jerry',
            DeviceModel(SBCModels.rpi4),
            sshDevice: SSHDevice( '192.168.4.40', 'P10u_p10u')
        )
    );
    box.add(projectTest);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Hive Listener to chnage à la volée le project
    //  Need Stack
    /*return MultiProvider(providers: [
      // ChangeNotifierProvider<ProjectViewModel>(create: (context) => ProjectViewModel()),
      ChangeNotifierProvider(create: (context) => doc),
      Provider(create: (context) => Highlighter()),
    ], child: const InputListener(child: View()));*/
    return const MyP();
  }
}