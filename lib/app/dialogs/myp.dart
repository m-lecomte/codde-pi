import 'dart:ffi';

import 'package:codde_pi/services/db/objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';

class MyP extends StatefulWidget{
  const MyP({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyP();
  }
}

class _MyP extends State<MyP> {
  var files;

  @override
  Widget build(BuildContext context) {
    return MypForm(context);
  }


}

class MypDialog extends StatelessWidget {
  const MypDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
    decoration: BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(10),
    boxShadow: const [
    BoxShadow(
    color: Colors.black26,
    blurRadius: 10.0,
    offset: Offset(0.0, 10.0),
    ),
    ],
    ),
    child: MypForm(context),
      ),
    );
  }
}

class MypForm extends StatelessWidget {
  // TODO: RESPONSIVE !!!
  // TODO: DB real queries + listeneing -> HookWidget ?
  final BuildContext context;
  final bool isMobile = false;

  const MypForm(this.context, {super.key});

  @override
  Widget build(BuildContext context) {
      return Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: const <Widget>[
            Text(
              "Repositories",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            RepoList(),
            SizedBox(height: 16.0),
            Text(
              "Recently opened",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            ProjectList(),
            SizedBox(height: 24.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: Icon(Icons.cancel),
            ),
          ],
        );
    }
}

enum MypIcons {
  repoLocal,
  repoRemote,
  projectLocal,
  projectRemote
}

class CardMyp extends StatelessWidget {
  final String text;
  final MypIcons image;

  const CardMyp(this.text, this.image, {super.key});

  @override
  Widget build(BuildContext context ) {
    return Card(child: Text(text));
  }
// TODO: image (center)
//  with text (bottom)
//  and options (3 dots at top right, opening menu options)
}

class RepoList extends HookWidget {
  const RepoList({super.key});

  @override
  Widget build(BuildContext context) {
    Box box = useHiveBox('repos');

    return box.values.isNotEmpty ? Row(
      children: <Widget>[
        ...box.values.map<Widget>(
        (data) {
      return CardMyp(data.name, data.sshDevice != null ? MypIcons.repoRemote : MypIcons.repoLocal);
    },
    ).toList(),
      ],
    ) :
    const Center(child: Text('No Repos')); // TODO: button add
  }
// TODO: `show all` button
}

/*class RepoList extends StatefulWidget {
  const RepoList({super.key});

  @override
  State<StatefulWidget> createState() => RepoListState();
// TODO: `show all` button
}

class RepoListState extends State<RepoList> {
  late Box repos;

  @override
  void initState() {
    super.initState();
    repos = Hive.box<Repo>('repos');
  }

  @override
  Widget build(BuildContext context) {
    ///Box repos = useQueryDB('repos');

    return repos.values.isNotEmpty ? Row(
      children: <Widget>[
        ...repos.values.map<Widget>(
              (data) {
            return CardMyp(data.name, data.sshDevice != null ? MypIcons.repoRemote : MypIcons.repoLocal);
          },
        ).toList(),
      ],
    ) :
    const Center(child: Text('No Repos')); // TODO: button add
  }

}*/

class ProjectList extends HookWidget {
  const ProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    Box box = useHiveBox('projects');

    return box.values.isNotEmpty ? Row(
      children: <Widget>[
        ...box.values.map<Widget>(
              (data) {
            return CardMyp(data.name, data.repo.sshDevice != null ? MypIcons.projectRemote : MypIcons.projectLocal);
          },
        ).toList(),
      ],
    ) :
    const Center(child: Text('No Repos')); // TODO: button add;
  }
// TODO: `show all` button
}

Box useHiveBox(String box) {
final state = useMemoized(() => box == 'projects' ? Hive.box<Project>(box) : Hive.box<Repo>(box));

return state;
}
