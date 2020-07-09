import 'package:flutter/material.dart';
import 'package:minitel_toolbox/presentation/shared/app_colors.dart';

class PortailBackgroundPainter extends CustomPainter {
  final Color backgroundColor;
  final Color foregroundColor;

  PortailBackgroundPainter(
      {this.foregroundColor = MinitelColors.primaryColor,
      this.backgroundColor = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    canvas
      ..drawRect(
        Offset.zero & size,
        paint..color = backgroundColor,
      )
      ..drawPath(
        Path()
          ..addPolygon(<Offset>[
            Offset.zero,
            Offset(size.width / 3, 0),
            Offset(0, size.height * 4 / 5),
          ], true),
        paint..color = foregroundColor.withOpacity(0.4),
      )
      ..drawPath(
          Path()
            ..addPolygon(<Offset>[
              Offset(size.width * 2 / 5, 0),
              Offset(size.width, 0),
              Offset(size.width, size.height / 2),
            ], true),
          paint..color = foregroundColor.withOpacity(0.5))
      ..drawPath(
          Path()
            ..addPolygon(<Offset>[
              Offset(0, size.height),
              Offset(size.width, size.height * 4 / 5),
              Offset(size.width, size.height),
            ], true),
          paint..color = foregroundColor.withOpacity(0.3))
      ..drawPath(
          Path()
            ..addPolygon(<Offset>[
              Offset(0, size.height / 2),
              Offset(size.width / 2, size.height),
              Offset(0, size.height),
            ], true),
          paint..color = foregroundColor.withOpacity(0.3))
      ..drawPath(
          Path()
            ..addPolygon(<Offset>[
              Offset(size.width * 3 / 4, size.height),
              Offset(size.width, size.height),
              Offset(size.width, size.height / 4),
            ], true),
          paint..color = foregroundColor.withOpacity(0.3))
      ..drawPath(
          Path()
            ..addPolygon(<Offset>[
              Offset(0, size.height / 3),
              Offset.zero,
              Offset(size.width, 0),
            ], true),
          paint..color = foregroundColor.withOpacity(0.3));
  }

  @override
  bool shouldRepaint(PortailBackgroundPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PortailBackgroundPainter oldDelegate) => false;
}
