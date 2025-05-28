/*
import 'dart:math';
import 'package:flutter/material.dart';

class OrbitCircle extends StatefulWidget {
  const OrbitCircle({super.key});

  @override
  _OrbitCircleState createState() => _OrbitCircleState();
}

class _OrbitCircleState extends State<OrbitCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(); // boucle infinie
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double radius = 100;

    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double angle = 2 * pi * _controller.value;

          double dx = radius * cos(angle);
          double dy = radius * sin(angle);

          return Stack(
            alignment: Alignment.center,
            children: [
              // Cercle principal
              Container(
                width: radius * 2,
                height: radius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 1),
                ),
              ),

              // Point qui orbite
              Positioned(
                left: radius + dx,
                top: radius + dy,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
*/

/*import 'dart:math';
import 'package:flutter/material.dart';

class OrbitingDot extends StatefulWidget {
  const OrbitingDot({super.key});

  @override
  _OrbitingDotState createState() => _OrbitingDotState();
}

class _OrbitingDotState extends State<OrbitingDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat(); // boucle infinie
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double radius = 60;

    return Center(
      child: SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Cercle central
            Container(
              width: radius * 2,
              height: radius * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
            ),
            // Point qui gravite
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double angle = _controller.value * 2 * pi;
                double x = radius * cos(angle);
                double y = radius * sin(angle);
                return Positioned(
                  left: radius + x - 4.5,
                  top: radius + y - 4.5,
                  child: child!,
                );
              },
              child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'dart:math';
import 'package:flutter/material.dart';

class OrbitRadar extends StatefulWidget {
  const OrbitRadar({super.key});

  @override
  State<OrbitRadar> createState() => _OrbitRadarState();
}

class _OrbitRadarState extends State<OrbitRadar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<double> radii = [30, 50, 90]; // rayon des cercles orbitaux
  final List<double> speeds = [1.0, 1.5, 0.5]; // vitesse relative par orbite

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: OrbitPainter(radii),
        child: Stack(
          alignment: Alignment.center,
          children: List.generate(radii.length - 1, (index) {
            return AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                final angle = _controller.value * 2 * pi * speeds[index];
                final x = cos(angle) * radii[index];
                final y = sin(angle) * radii[index];
                return Transform.translate(
                  offset: Offset(x, y),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}

class OrbitPainter extends CustomPainter {
  final List<double> radii;

  OrbitPainter(this.radii);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (final radius in radii) {
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
