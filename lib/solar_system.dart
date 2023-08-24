import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

class SolarSystemWidget extends StatefulWidget {
  const SolarSystemWidget({super.key});

  @override
  State<SolarSystemWidget> createState() => _SolarSystemWidgetState();
}

class _SolarSystemWidgetState extends State<SolarSystemWidget> {
  late final Timer timer;
  double theta = 0.001;

  @override
  void initState() {
    super.initState();
   timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      setState(() {
        theta += 0.003;
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
          child: InteractiveViewer(
            child: CustomPaint(
              painter: SolarSystemPainter(theta),
              child:  SizedBox(
                width: size.width * 2,
                height: size.height,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SolarSystemPainter extends CustomPainter {
  double theta;

  SolarSystemPainter(this.theta);

  @override
  void paint(Canvas canvas, Size size) {
    double radius = 30.0;
    Rect rect = Offset.zero & size;

    // Create a radial gradient for the Sun's appearance
    final sunGradient = RadialGradient(
      colors: [Colors.yellow.shade600, Colors.orange.shade900],
      stops: const [0.2, 1.0],
      center: const Alignment(0.0, 0.0),
      radius: 0.8,
    );

    final sunPaint = Paint()
      ..shader = sunGradient.createShader(
        Rect.fromCircle(center: rect.center, radius: radius),
      );

    //Sun
    Offset sun = rect.center;
    canvas.drawCircle(sun, radius, sunPaint);

    //Planet Speeds normalised in the range of 1 to 10
    // Mercury: 10.0
    // Venus: 6.46
    // Earth: 5.09
    // Mars: 3.8
    // Jupiter: 2.38
    // Saturn: 1.92
    // Uranus: 1.34
    // Neptune: 1.01

    //Mercury
    Rect rectMercury =
        Rect.fromCenter(center: rect.center, width: 100, height: 130);
    drawOval(canvas, rectMercury);
    drawCircle(canvas, rectMercury, 8, theta, 10.0);

    //Venus
    Rect rectVenus =
        Rect.fromCenter(center: rect.center, width: 160, height: 190);
    drawOval(canvas, rectVenus);
    drawCircle(canvas, rectVenus, 10, theta, 6.46);

    //Earth
    Rect rectEarth =
        Rect.fromCenter(center: rect.center, width: 220, height: 250);
    drawOval(canvas, rectEarth);
    drawCircle(canvas, rectEarth, 12, theta, 5.09);

    //Mars
    Rect rectMars =
        Rect.fromCenter(center: rect.center, width: 280, height: 310);
    drawOval(canvas, rectMars);
    drawCircle(canvas, rectMars, 11, theta, 3.8);

    //Jupiter
    Rect rectJupiter =
    Rect.fromCenter(center: rect.center, width: 340, height: 370);
    drawOval(canvas, rectJupiter);
    drawCircle(canvas, rectJupiter, 15, theta, 2.38);

    //Saturn
    Rect rectSaturn =
    Rect.fromCenter(center: rect.center, width: 400, height: 430);
    drawOval(canvas, rectSaturn);
    drawCircle(canvas, rectSaturn, 13, theta, 1.92);

    //Uranus
    Rect rectUranus =
    Rect.fromCenter(center: rect.center, width: 460, height: 490);
    drawOval(canvas, rectUranus);
    drawCircle(canvas, rectUranus, 12, theta, 1.34);

    //Neptune
    Rect rectNeptune =
    Rect.fromCenter(center: rect.center, width: 520, height: 550);
    drawOval(canvas, rectNeptune);
    drawCircle(canvas, rectNeptune, 10, theta, 1.01);
  }

  void drawOval(Canvas canvas, Rect rect) {
    Paint ovalPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
    ..strokeWidth = 1.3;
    canvas.drawOval(rect, ovalPaint);
  }

  void drawCircle(
    Canvas canvas,
    Rect rect,
    double r,
    double theta,
    double speed,
  ) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    double angleRadians = -math.pi * theta + speed;
    double radiusX = rect.width / 2;
    double radiusY = rect.height / 2;
    double circleCenterX = rect.center.dx + radiusX * math.cos(angleRadians);
    double circleCenterY = rect.center.dy + radiusY * math.sin(angleRadians);
    canvas.drawCircle(Offset(circleCenterX, circleCenterY), r, paint);
    canvas.save();
    canvas.translate(circleCenterX, circleCenterY);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
