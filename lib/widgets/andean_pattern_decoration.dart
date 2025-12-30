import 'package:flutter/material.dart';
import 'package:museo_punchao/utils/app_theme.dart';

class AndeanPatternDecoration extends StatelessWidget {
  final Widget child;
  final bool showTopPattern;
  final bool showBottomPattern;

  const AndeanPatternDecoration({
    super.key,
    required this.child,
    this.showTopPattern = false,
    this.showBottomPattern = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (showTopPattern)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: const Size(double.infinity, 80),
              painter: AndeanPatternPainter(),
            ),
          ),
        if (showBottomPattern)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: const Size(double.infinity, 80),
              painter: AndeanPatternPainter(),
            ),
          ),
      ],
    );
  }
}

class AndeanPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.patternColor.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final patternSize = 40.0;
    final rows = (size.height / patternSize).ceil();
    final cols = (size.width / patternSize).ceil();

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        final x = col * patternSize;
        final y = row * patternSize;

        // Draw stepped pyramid pattern (typical Andean motif)
        _drawSteppedPattern(canvas, paint, Offset(x, y), patternSize);
      }
    }
  }

  void _drawSteppedPattern(Canvas canvas, Paint paint, Offset offset, double size) {
    final path = Path();
    final step = size / 8;

    // Create a stepped pyramid pattern
    path.moveTo(offset.dx + size / 2, offset.dy);
    path.lineTo(offset.dx + size / 2 + step, offset.dy + step);
    path.lineTo(offset.dx + size / 2 + step * 2, offset.dy + step);
    path.lineTo(offset.dx + size / 2 + step * 2, offset.dy + step * 2);
    path.lineTo(offset.dx + size / 2 + step * 3, offset.dy + step * 2);
    path.lineTo(offset.dx + size / 2 + step * 3, offset.dy + step * 3);
    path.lineTo(offset.dx + size / 2 + step * 4, offset.dy + step * 4);
    path.lineTo(offset.dx + size / 2 - step * 4, offset.dy + step * 4);
    path.lineTo(offset.dx + size / 2 - step * 3, offset.dy + step * 3);
    path.lineTo(offset.dx + size / 2 - step * 3, offset.dy + step * 2);
    path.lineTo(offset.dx + size / 2 - step * 2, offset.dy + step * 2);
    path.lineTo(offset.dx + size / 2 - step * 2, offset.dy + step);
    path.lineTo(offset.dx + size / 2 - step, offset.dy + step);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
