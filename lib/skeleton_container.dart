import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'skeleton_painter.dart';

class AnimatedSkeleton extends AnimatedWidget {
  final Widget? child;
  final Animation<double> animation;

  AnimatedSkeleton({Key? key, required AnimationController listenable, this.child})
      : animation = CurvedAnimation(
          parent: listenable,
          curve: Curves.easeIn,
        ),
        super(key: key, listenable: listenable);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return _Skeleton(
          animation.value,
          child: child,
        );
      },
      child: child,
    );
  }
}

class _Skeleton extends SingleChildRenderObjectWidget {
  final double animValue;
  final Widget? child;

  _Skeleton(this.animValue, {required this.child}) : super(child: child);

  @override
  RenderSkeleton createRenderObject(BuildContext context) => RenderSkeleton(animValue);

  @override
  void updateRenderObject(BuildContext context, RenderSkeleton skeleton) {
    skeleton..animValue = animValue;
    skeleton.markNeedsPaint();
    // ..alwaysIncludeSemantics = alwaysIncludeSemantics;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('animValue', animValue));
  }
}
