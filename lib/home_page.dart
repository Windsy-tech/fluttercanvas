import 'package:flutter/material.dart';
import 'package:fluttercanvas/bouncing_balls.dart';
import 'package:fluttercanvas/charts/line_chart.dart';
import 'package:fluttercanvas/mesmerize.dart';
import 'package:fluttercanvas/solar_system.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Solar System
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SolarSystemWidget(),
                      ),
                    );
                  },
                  child: const Text("Solar System Canvas"),
                ),

                //Bouncing Balls
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BouncingBalls(),
                      ),
                    );
                  },
                  child: const Text("Bouncing Balls"),
                ),

                //Line Chart
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LineChartWidget(),
                      ),
                    );
                  },
                  child: const Text("Line Chart"),
                ),

                //Line Chart
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MesmerizeWidget(),
                      ),
                    );
                  },
                  child: const Text("Mesmerize"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
