import 'dart:io';

import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class SimpleButtonPainter extends CustomPainter {
  final BuildContext context;
  Function(Map<String, Object>) emit;

  SimpleButtonPainter(this.context, this.emit); // context from CanvasTouchDetector

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);

    /*myCanvas.drawCircle(const Offset(10, 10), 60, Paint()..color = Colors.orange,
        onTapDown: (tapdetail) {
      print("orange Circle touched");
      stdout.writeln("circle touched");
      emit({"simple_button": true});
    }/*, onPanDown: (tapdetail) {
      print("orange circle swiped");
      stdout.writeln("circle pan");
    }*/);*/
    canvas.drawCircle(const Offset(10, 10), 60, Paint()..color = Colors.orange);

    /*myCanvas.drawLine(
        Offset(0, 0),
        Offset(size.width - 100, size.height - 100),
        Paint()
          ..color = Colors.black
          ..strokeWidth = 50,
        onPanUpdate: (detail) {
          print('Black line Swiped'); //do cooler things here. Probably change app state or animate
        });*/
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SimpleButton extends StatelessWidget {
  final Function(Map) emit;

  const SimpleButton(this.emit, {super.key});

  @override
  Widget build(BuildContext context) {
    return CanvasTouchDetector(
      builder: (context) {
        return CustomPaint(
          painter: SimpleButtonPainter(context, emit),
        );
      },
    );
  }
}