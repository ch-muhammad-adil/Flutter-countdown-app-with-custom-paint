import 'package:flutter/material.dart';

class MyTextCustomPainter extends CustomPainter {
  MyTextCustomPainter({this.text = ''});

  String text = '';

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..color = Colors.blueAccent;
    canvas.drawCircle(const Offset(150, 150), 150, paint);
    const textStyle = TextStyle(
      color: Colors.brown,
      fontSize: 50,
    );
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) / 2;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
