import 'dart:io';

import 'package:codde_pi/core/components/simple_button.dart';
import 'package:codde_pi/services/socket.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:touchable/touchable.dart';

class Controller extends HookWidget {
  final streamSocket = StreamSocket();

  Controller({super.key});

  @override
  Widget build(BuildContext context) {
    final socket = useSocketIO(
        uri: 'localhost',
        port: '8080',
        optionBuilder: OptionBuilder().setTransports(['websocket']).build());

    useEffect(() {
      print('try to connect');
      socket.onConnect((_) {
        print('connect');
        socket.emit('my_event', 'test');
      });

      // When an event received from server, data is added to the stream
      socket.on('event', (data) => streamSocket.addResponse);
      socket.on('my_response', (data) => print('response'));
      socket.onDisconnect((_) => print('disconnect'));

      return null; // socket.dispose();
    }, [socket]);

    return Center(
      child: Container(
        height: 70,
        width: 70,
        child: GestureDetector(
            onTap: () { print("hello world :')"); socket.emit('my_event', 'test2');},
            child: Container(color: Colors.red)
        ),
      ), // CustomPaint(child: SimpleButtonPainter(context, (p0) => null),)
    );


    /*Center(
      child: CanvasTouchDetector(
        gesturesToOverride: const [GestureType.onTapDown, GestureType.onTapUp, GestureType.onScaleUpdate, GestureType.onScaleUpdate],
        builder: (context) {
          return CustomPaint(
            painter: SimpleButtonPainter(context, (p0) {
              print("action $p0");
            }),
          );
        }),
    );*/
  }
}

/*
class Controller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ControllerState();
  }

}

class ControllerState extends State<Controller> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleButton((p0) => {}),
    );
  }

}*/
