import 'package:flutter/material.dart';

class LoginBackgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    var topPaint = Paint();
    var rect = Offset.zero & size;
    topPaint.shader = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [.01, .25],
      colors: [
        Color(0xfff8a55f),
        Color(0xfff1665f),
      ],
    ).createShader(rect);

    var topPath = Path();
    topPath.moveTo(0, 0);
    topPath.lineTo(size.width, 0);
    topPath.quadraticBezierTo(w * 0.9, h * 0.1, w * 0.6, h * 0.1);
    topPath.quadraticBezierTo(w * 0.2, h * 0.1, w * 0.1, h * 0.3);
    topPath.quadraticBezierTo(w * 0.06, h * 0.4, w * 0, h * 0.4);
    topPath.close();

    Paint bottomPaint = Paint();
    bottomPaint.shader = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [.05, 1],
      colors: [
        Color(0xff0ce8f9),
        Color(0xff45b7fe),
      ],
    ).createShader(rect);
    var bottomPath = Path();
    bottomPath.moveTo(w, h);
    bottomPath.lineTo(w, h * 0.7);
    bottomPath.quadraticBezierTo(w * .9, h * .95, w * .2, h * .97);
    bottomPath.quadraticBezierTo(w * .1, h * .98, w * .1, h);

    canvas.drawPath(topPath, topPaint);
    canvas.drawPath(bottomPath, bottomPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
