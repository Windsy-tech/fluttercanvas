import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class BouncingBalls extends StatefulWidget {
  const BouncingBalls({super.key});

  @override
  State<BouncingBalls> createState() => _BouncingBallsState();
}

class _BouncingBallsState extends State<BouncingBalls> {
  late final Timer timer;
  double speed = 1.0;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      setState(() {
        speed += 0.001;
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
      body: SafeArea(
        child: Center(
          child: CustomPaint(
            painter: BouncingBallsPainter(speed),
            child:  SizedBox(
              width: size.width /2,
              height: size.height/2,
            ),
          ),
        ),
      ),
    );
  }
}

double x = 0;
double y = 0;

class BouncingBallsPainter extends CustomPainter {
  double speed;
  BouncingBallsPainter(this.speed);

  @override
  void paint(Canvas canvas, Size size) {
    double radius = 10.0;
    Rect rect = Offset.zero & size;
    double w = size.width ;
    double h = size.height;

    Paint paint = Paint()..color = Colors.orange;
    Paint paintBall = Paint()..color = Colors.blue;

    if (x < w) {
      x = x + speed;
    } else {
      x = x - speed;
    }

    if (y < h) {
      y = y + speed;
    }else {
      y = y - speed;
    }


    print("X: $x, Y: $y");
    canvas.drawRect(rect, paint);
    canvas.drawCircle( Offset(x, y), radius, paintBall);
    canvas.save();
    canvas.translate(x, y);
    canvas.rotate(math.pi);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
