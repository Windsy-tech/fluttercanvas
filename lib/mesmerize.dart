import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class MesmerizeWidget extends StatefulWidget {
  const MesmerizeWidget({Key? key}) : super(key: key);

  @override
  State<MesmerizeWidget> createState() => _MesmerizeWidgetState();
}

class _MesmerizeWidgetState extends State<MesmerizeWidget> {
  late final Timer timer;
  double speed = 1.0;
  double speedStep = 0.1;
  double step = 30;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 25), (timer) {
      setState(() {
        speed += speedStep / 10;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 500,
              child: CustomPaint(
                painter: MesmerizePainter(speed, step),
                child: Container(),
              ),
            ),
            const Text("Speed"),
            Slider(
              value: speedStep,
              divisions: 10,
              label: speedStep.toString(),
              onChanged: (value) {
                setState(() {
                  speedStep = value;
                });
              },
            ),
            const Text("Steps"),
            Slider(
              value: step,
              divisions: 100,
              min: 10,
              max: 100,
              onChanged: (value) {
                setState(() {
                  step = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MesmerizePainter extends CustomPainter {
  double speed;
  double step;
  MesmerizePainter(this.speed, this.step);

  @override
  void paint(Canvas canvas, Size size) {
    double maxAngle = 720;
    double radius = size.width / 2;
    Rect rect = Offset.zero & size;
    double x = size.width / 2;
    double y = size.height / 2;
    for (double angle = 0.01; angle <= maxAngle; angle += step) {
      drawCircle(canvas, Offset(x, y), radius, angle, speed);
      radius = radius * 0.8;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawCircle(
      Canvas canvas, Offset offset, double radius, double angle, double speed) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
/*    double angleRadians = -math.pi + speed * 10;
    double x = rect.center.dx + radiusX * math.cos(angleRadians);
    double y = rect.center.dy + radiusY * math.sin(angleRadians);*/
    canvas.drawCircle(offset, radius, paint);
    //print("X: $x, Y: $y");
    double k = radius * 2;
    Rect rect1 =
        Rect.fromCenter(center: Offset.zero, width: k * 0.81, height: k * 0.99);
    Paint ovalPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.save();
    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(angle * math.pi / 180 * speed);
    canvas.drawOval(rect1, ovalPaint);
    canvas.restore();
  }
}
