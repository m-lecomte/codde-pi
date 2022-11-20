import 'dart:io';

import 'package:codde_pi/core/components/simple_button.dart';
import 'package:codde_pi/services/socket.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:touchable/touchable.dart';

class Controller2 extends StatefulWidget {
  const Controller2({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Controller2State();
  }
}

class Controller2State extends State<Controller2> {
  @override
  Widget build(BuildContext context) {
    print('something works');

    return Center(
      child: Container(
        height: 50,
        width: 50,
        child: GestureDetector(
        onTap: () => print("hello world :')"),
        child: Container(color: Colors.red)
      ),), // CustomPaint(child: SimpleButtonPainter(context, (p0) => null),)
    );
//SimpleButton((p0) => {}),
  }
}
