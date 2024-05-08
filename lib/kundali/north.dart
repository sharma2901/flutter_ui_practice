import 'package:flutter/material.dart';

const canvasSize = 379.0;
const signTextSize = (canvasSize / 20) * .8;
const asc = 8;

class NorthChart extends StatelessWidget {
  const NorthChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomPaint(
        painter: NorthChartCustomPainter(),
        size: const Size(canvasSize, canvasSize),
        // child: const Text("custom paint child"),
      ),
    );
  }
}

class NorthChartCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var s = canvasSize;
    Offset center = Offset(s / 2, s / 2);
    Offset topLeft = const Offset(0, 0);
    Offset topCenter = Offset(s / 2, 0);
    Offset topRight = Offset(s, 0);
    Offset middleLeft = Offset(0, s / 2);
    Offset middleRight = Offset(s, s / 2);
    Offset bottomLeft = Offset(0, s);
    Offset bottomMiddle = Offset(s / 2, s);
    Offset bottomRight = Offset(s, s);
    Offset q1 = Offset(s / 4, s / 4);
    Offset q2 = Offset(3 * s / 4, s / 4);
    Offset q3 = Offset(s / 4, 3 * s / 4);
    Offset q4 = Offset(3 * s / 4, 3 * s / 4);

    final Paint paint = Paint();
    paint.color = Colors.deepOrange;
    paint.strokeWidth = 2;
    // 1st house
    canvas.drawLine(topCenter, q1, paint);
    canvas.drawLine(q1, center, paint);
    canvas.drawLine(center, q2, paint);
    canvas.drawLine(q2, topCenter, paint);

    // 2nd house
    canvas.drawLine(topCenter, topLeft, paint);
    canvas.drawLine(topLeft, q1, paint);
    canvas.drawLine(q1, topCenter, paint);

    // 3rd house
    canvas.drawLine(topLeft, middleLeft, paint);
    canvas.drawLine(middleLeft, q1, paint);
    canvas.drawLine(q1, topLeft, paint);

    // 4th house
    canvas.drawLine(middleLeft, q3, paint);
    canvas.drawLine(q3, center, paint);
    canvas.drawLine(center, q1, paint);
    canvas.drawLine(q1, middleLeft, paint);

    // 5th house
    canvas.drawLine(middleLeft, bottomLeft, paint);
    canvas.drawLine(bottomLeft, q3, paint);
    canvas.drawLine(q3, middleLeft, paint);

    // 6th house
    canvas.drawLine(bottomLeft, bottomMiddle, paint);
    canvas.drawLine(bottomMiddle, q3, paint);
    canvas.drawLine(q3, bottomLeft, paint);

    // 7th house
    canvas.drawLine(center, q3, paint);
    canvas.drawLine(q3, bottomMiddle, paint);
    canvas.drawLine(bottomMiddle, q4, paint);
    canvas.drawLine(q4, center, paint);

    // 8th house
    canvas.drawLine(bottomMiddle, bottomRight, paint);
    canvas.drawLine(bottomRight, q4, paint);
    canvas.drawLine(q4, bottomMiddle, paint);

    // 9th house
    canvas.drawLine(bottomRight, middleRight, paint);
    canvas.drawLine(middleRight, q4, paint);
    canvas.drawLine(q4, bottomRight, paint);

    // 10th house
    canvas.drawLine(center, q4, paint);
    canvas.drawLine(q4, middleRight, paint);
    canvas.drawLine(middleRight, q2, paint);
    canvas.drawLine(q2, center, paint);

    // 11th house
    canvas.drawLine(topRight, q2, paint);
    canvas.drawLine(q2, middleRight, paint);
    canvas.drawLine(middleRight, topRight, paint);

    // 12th house
    canvas.drawLine(topCenter, q2, paint);
    canvas.drawLine(q2, topRight, paint);
    canvas.drawLine(topRight, topCenter, paint);

    var getSignForHouse = signResolver(asc);
    var houseToOffsetMap = <int, Offset>{
      1: center,
      2: q1,
      3: q1,
      4: center,
      5: q3,
      6: q3,
      7: center,
      8: q4,
      9: q4,
      10: center,
      11: q2,
      12: q2,
    };
    // Draw Sign number
    for (int i = 1; i <= 12; i++) {
      int sign = getSignForHouse(i);
      drawSign(canvas, houseToOffsetMap[i]!, i, sign);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

Function signResolver(int asc) => (int house) {
      int sign = (asc + house - 1) % 12;
      return sign == 0 ? 12 : sign;
    };

void drawSign(
  Canvas canvas,
  Offset originalOffset,
  int house,
  int sign,
) {
  var span = TextSpan(
    style: const TextStyle(
      color: Colors.deepPurple,
      fontSize: signTextSize,
    ),
    text: sign.toString(),
  );
  TextPainter tp = TextPainter(
    text: span,
    textDirection: TextDirection.ltr,
  );
  tp.layout();
  Offset finalOffset = originalOffset;
  switch (house) {
    case 1:
      finalOffset =
          originalOffset - const Offset(signTextSize / 2, signTextSize * 2);
      break;
    case 2:
      finalOffset =
          originalOffset - const Offset(signTextSize / 2, signTextSize * 2);
      break;
    case 3:
    case 5:
      finalOffset =
          originalOffset - const Offset(signTextSize * 2, signTextSize / 2);
      break;
    case 4:
      finalOffset =
          originalOffset - const Offset(signTextSize * 2, signTextSize / 2);
      break;
    case 6:
      finalOffset =
          originalOffset - const Offset(signTextSize / 2, signTextSize * -1);
      break;
    case 7:
      finalOffset =
          originalOffset - const Offset(signTextSize / 2, signTextSize * -1);
      break;
    case 8:
      finalOffset =
          originalOffset - const Offset(signTextSize / 2, signTextSize / -2);
      break;
    case 9:
      finalOffset =
          originalOffset - const Offset(signTextSize * -1, signTextSize / 2);
      break;
    case 10:
      finalOffset =
          originalOffset - const Offset(signTextSize * -1, signTextSize / 2);
      break;
    case 11:
      finalOffset =
          originalOffset - const Offset(signTextSize * -1, signTextSize / 2);
      break;
    case 12:
      finalOffset =
          originalOffset - const Offset(signTextSize / 2, 2 * signTextSize);
      break;
  }

  tp.paint(canvas, finalOffset);
}
