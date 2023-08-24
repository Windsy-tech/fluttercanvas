import 'package:flutter/material.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 250,
            height: 200,
            child: CustomPaint(
              painter: LineChartPainter(),
              child: Container(width: 100,height: 100,),
            ),
          ),
        ),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color= Colors.blueAccent;
    Rect rect = Offset.zero & size;
    canvas.drawRect(rect, paint);
    canvas.drawLine(rect.center,  Offset(rect.center.dx,0), Paint()..color=Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
