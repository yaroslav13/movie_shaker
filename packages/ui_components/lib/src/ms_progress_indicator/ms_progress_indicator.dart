import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_components/src/shared/assets.gen.dart';

const _size = Size.square(150);

final class MsProgressIndicator extends StatelessWidget {
  @Deprecated('Use MsProgressIndicator.moviePosters() instead')
  factory MsProgressIndicator.glasses({Key? key}) {
    return MsProgressIndicator._(
      animationJson: MsAssets.animations.a3dGlassesAnimation,
      key: key,
    );
  }

  factory MsProgressIndicator.moviePosters({Key? key}) {
    return MsProgressIndicator._(
      animationJson: MsAssets.animations.moviePosterAnimation,
      key: key,
    );
  }

  const MsProgressIndicator._({
    required this.animationJson,
    super.key,
  });

  final String animationJson;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      animationJson,
      repeat: true,
      animate: true,
      height: _size.height,
      width: _size.width,
      alignment: Alignment.center,
      fit: BoxFit.contain,
    );
  }
}
