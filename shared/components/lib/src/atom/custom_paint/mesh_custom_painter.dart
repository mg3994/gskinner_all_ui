import 'package:flutter/material.dart';

import '../mask/widget_model.dart';



class MeshCustomPainter extends CustomPainter {
  final VertexMeshInstance? _meshInstance;

  MeshCustomPainter(this._meshInstance);

  @override
  void paint(canvas, size) {
    canvas.scale(size.width * 0.5, size.height * 0.5);
    canvas.translate(1.0, 1.0);

    // Flip y
    canvas.scale(1, -1);

    if (_meshInstance != null) {
      final paint = Paint();
      if (_meshInstance.texture != null) {
        paint.shader = ImageShader(
            _meshInstance.texture!,
            TileMode.clamp,
            TileMode.clamp,
            Matrix4.identity()
                .scaled(1 / _meshInstance.texture!.width,
                    1 / _meshInstance.texture!.height, 1.0)
                .storage);
      }

      canvas.drawVertices(_meshInstance.vertices, BlendMode.multiply, paint);
    }
  }

  @override
  bool shouldRepaint(MeshCustomPainter oldDelegate) {
    // TODO: Do an actual state diff to check for repaint
    return true;
  }
}


