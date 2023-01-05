import 'dart:io';

import 'package:codde_pi/app/pages/editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:codde_pi/theme.dart' as theme;

class FileTree extends StatefulWidget {
  String path;

  FileTree(this.path);

  @override
  State<StatefulWidget> createState() => _FileTree();
}

class _FileTree extends State<FileTree> {
  late TreeViewController _treeViewController;
  late List<Node<FileSystemEntity>> nodes;

  @override
  void initState() {
    nodes = listFiles(widget.path);
    _treeViewController = TreeViewController(children: nodes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, widget) => TreeView(
      theme: theme.treeViewTheme,
      controller: _treeViewController,
      onNodeTap: (key) async {
        Node<FileSystemEntity>? node = _treeViewController.getNode(key);
        if (node != null) {
          if (await isDirectory(node.key) == true) {
            var updated = _treeViewController.updateNode(
                key,
                node.copyWith(
                    expanded: !node.expanded,
                    children: !node.expanded
                        ? listFiles(node.key)
                        : []));
            setState(() {
              _treeViewController =
                  _treeViewController.copyWith(children: updated);
            });
          } else {
            openFile(ref, node.key);
          }
        }
      },
    ));
  }
}

void openFile(WidgetRef ref, String path) {
  FileTabManager provider = ref.read(fileTabManager.notifier);
  int? selectedContent = provider.selectedContent;
  provider.insertContent(
      selectedContent != null ? selectedContent + 1 : provider.contents.isEmpty ? 0 : provider.contents.length - 1,
      FileContent(path.split("/").last, path.split("/").last.split('.').last == "cjson" ? TabSubject.controller : TabSubject.file,
          CddPage(path, path.split("/").last.split('.').last == "cjson" ? TabSubject.controller : TabSubject.file), path));
  provider.openContent(selectedContent != null ? (selectedContent + 1) : provider.contents.length - 1);
}

List<Node<FileSystemEntity>> listFiles(String path) {
  var list = Directory(path)
      .listSync() // TODO: sort files alphabetically
      .map((e) =>
          Node<FileSystemEntity>(key: e.path, label: e.path.split('/').last))  // define here if is a parent/directory
      .toList();
  list.sort((a, b) => a.label.compareTo(b.label));
  return list;
}

Future<bool> isDirectory(String path) async {
  var rst = FileSystemEntity.isDirectory(path);
  return await rst;
}