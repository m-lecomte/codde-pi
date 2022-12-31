import 'package:codde_pi/core/components/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../app/pages/editor.dart';

DocumentProvider useDocProvider({required String path, optionBuilder}) {
  final doc = useMemoized(() => DocumentProvider());
  doc.openFile(path);

  return doc;
}

ValueNotifier<List> useFileContent() {
  final content = useState([]);
  content.value.add(FileContent('Form', TabSubject.form, const CddPage('', TabSubject.form), ''));
  return content;
}

ValueNotifier<List> useListWidgets(Function function) {
  final state = useState([]);
  final list = function(); // TODO: useemoized ?
  state.value = list;
  return state;
}