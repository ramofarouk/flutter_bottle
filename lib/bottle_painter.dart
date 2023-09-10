import 'package:flutter/material.dart';

class BottlePainter extends CustomPainter {
  final double waterHeightFraction; // Hauteur de l'eau

  BottlePainter(this.waterHeightFraction);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    double neckHeight = size.height * 0.2;
    double bodyHeight = size.height * 0.8;
    double bottleNeckWidth = size.width / 2;
    double bottleBodyWidth = size.width;
    // Dessiner la bouteille vide
    paint.color = Colors.white;
    // Dessiner le cou de la bouteille
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(
          (size.width - bottleNeckWidth) / 2,
          size.height - bodyHeight - neckHeight,
          (size.width + bottleNeckWidth) / 2,
          size.height - (bodyHeight - 20),
        ),
        topLeft: const Radius.circular(10),
        topRight: const Radius.circular(10),
      ),
      paint,
    );
    // Dessiner la bouteille
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(
          (size.width - bottleBodyWidth) / 2,
          size.height - bodyHeight,
          (size.width + bottleBodyWidth) / 2,
          size.height,
        ),
        topLeft: Radius.circular(size.width * 0.3),
        topRight: Radius.circular(size.width * 0.3),
        bottomLeft: Radius.circular(size.width * 0.1),
        bottomRight: Radius.circular(size.width * 0.1),
      ),
      paint,
    );

    // Dessiner la hauteur de l'eau
    paint.color = Colors.blue;
    // Calculer la hauteur de l'eau en fonction de la fraction
    double waterHeight = size.height * waterHeightFraction;
    double waterTop = size.height - waterHeight;

    if (waterHeightFraction >= 0.79) {
      canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTRB(
            (size.width - bottleNeckWidth) / 2,
            size.height - bodyHeight - neckHeight + (waterTop * 1.5),
            (size.width + bottleNeckWidth) / 2,
            size.height - (bodyHeight - 20),
          ),
        ),
        paint,
      );
      canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTRB(
            (size.width - bottleBodyWidth) / 2,
            size.height * 0.2,
            (size.width + bottleBodyWidth) / 2,
            size.height,
          ),
          topLeft: Radius.circular(size.width * 0.3),
          topRight: Radius.circular(size.width * 0.3),
          bottomLeft: Radius.circular(size.width * 0.1),
          bottomRight: Radius.circular(size.width * 0.1),
        ),
        paint,
      );
    } else {
      canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTRB(
            (size.width - bottleBodyWidth) / 2,
            waterTop,
            (size.width + bottleBodyWidth) / 2,
            size.height,
          ),
          topLeft: waterHeightFraction >= 0.79
              ? Radius.circular(size.width * 0.3)
              : Radius.zero,
          topRight: waterHeightFraction >= 0.79
              ? Radius.circular(size.width * 0.3)
              : Radius.zero,
          bottomLeft: Radius.circular(size.width * 0.1),
          bottomRight: Radius.circular(size.width * 0.1),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
