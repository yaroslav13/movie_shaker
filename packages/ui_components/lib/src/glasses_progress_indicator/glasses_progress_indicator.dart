import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_components/src/shared/assets.gen.dart';

const _size = Size.square(150);

final class GlassesProgressIndicator extends StatelessWidget {
  const GlassesProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      MsAssets.animations.a3dGlassesAnimation,
      repeat: true,
      animate: true,
      height: _size.height,
      width: _size.width,
      alignment: Alignment.center,
      fit: BoxFit.contain,
    );
  }
}
