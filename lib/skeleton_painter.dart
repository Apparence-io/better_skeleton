import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vector_math/vector_math_64.dart' as v;

const angle = -math.pi / 5;
const double skeletonHeight = 50;

class RenderSkeleton extends RenderProxyBox {
  double animValue;
  bool _alwaysIncludeSemantics;

  RenderSkeleton(
    this.animValue, {
    bool alwaysIncludeSemantics = false,
    RenderBox? child,
  })  : _alwaysIncludeSemantics = alwaysIncludeSemantics,
        super(child);

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      return;
    }
    context.paintChild(child!, offset);
    // draw our skeleton
    final canvas = context.canvas;
    var bounds = child!.paintBounds;
    var maxHeight = (diagonal * math.sin(angle)).abs() + bounds.height * 2;
    var decalage = diagonal;
    var painter = Paint()..color = Colors.white38;
    var rect = Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height);

    canvas.save();
    canvas.clipRect(rect);
    canvas.saveLayer(rect, painter);
    canvas.rotate(angle);
    canvas.translate(offset.dx, offset.dy);
    canvas.translate(0, maxHeight * animValue);
    canvas.drawRect(Rect.fromLTWH(-decalage, -skeletonHeight, diagonal * 3, skeletonHeight), painter);
    canvas.restore();
    canvas.restore();
  }

  @override
  void visitChildrenForSemantics(RenderObjectVisitor visitor) {
    if (child != null && (alwaysIncludeSemantics)) visitor(child!);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('animValue', animValue));
    properties.add(FlagProperty('alwaysIncludeSemantics', value: alwaysIncludeSemantics, ifTrue: 'alwaysIncludeSemantics'));
  }

  // ---------------------------
  // GETTERS & SETTERS
  // ---------------------------
  bool get alwaysIncludeSemantics => _alwaysIncludeSemantics;

  set alwaysIncludeSemantics(bool value) {
    if (value == _alwaysIncludeSemantics) return;
    _alwaysIncludeSemantics = value;
    markNeedsSemanticsUpdate();
  }

  double get diagonal {
    var height = child!.paintBounds.height;
    var width = child!.paintBounds.width;
    return math.sqrt((width * width) + (height * height));
  }

  v.Vector3 getTranslation(RenderObject parent) => child!.getTransformTo(parent).getTranslation();
}
