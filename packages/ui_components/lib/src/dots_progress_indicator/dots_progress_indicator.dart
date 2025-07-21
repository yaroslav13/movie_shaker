import 'package:flutter/material.dart';
import 'package:ui_components/src/dots_progress_indicator/dots_progress_indicator_theme.dart';

const _dotSize = 6.0;
const _spacing = 2.0;

const _minHeight = _dotSize * 1.5;

final class DotsProgressIndicator extends StatefulWidget {
  const DotsProgressIndicator({
    this.color,
    this.dotSize,
    this.spacing,
    super.key,
  });

  final double? dotSize;
  final double? spacing;
  final Color? color;

  @override
  State<StatefulWidget> createState() => _DotsLoaderIndicatorState();
}

final class _DotsLoaderIndicatorState extends State<DotsProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _loadingAnimation;

  void _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 275),
    );

    _loadingAnimation = Tween<double>(begin: 1, end: 1.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.ease),
    );
  }

  @override
  void initState() {
    super.initState();
    _initAnimation();

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final theme = Theme.of(context).extension<DotsProgressIndicatorTheme>();

    final dotSize = widget.dotSize ?? theme?.dotSize ?? _dotSize;
    final color = widget.color ?? theme?.color ?? colorScheme.primary;
    final spacing = widget.spacing ?? theme?.spacing ?? _spacing;

    return SizedBox(
      height: _minHeight,
      width: dotSize * 4 + spacing * 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _LoaderDot(
            animation: _loadingAnimation,
            color: color,
            opacitySubtract: 0.7,
          ),
          _LoaderDot(
            animation: _loadingAnimation,
            color: color,
            opacitySubtract: 0.8,
            additionalSize: const Size.square(2.5),
          ),
          _LoaderDot(
            animation: _loadingAnimation,
            color: color,
            opacitySubtract: 0.7,
          ),
        ],
      ),
    );
  }
}

final class _LoaderDot extends StatelessWidget {
  const _LoaderDot({
    required this.animation,
    this.color,
    this.opacitySubtract = 0,
    this.additionalSize = Size.zero,
  });

  final Animation<double> animation;
  final Color? color;
  final double opacitySubtract;
  final Size additionalSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => Opacity(
        opacity: animation.value - opacitySubtract,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: _spacing),
          height: _dotSize * (additionalSize.height - animation.value).abs(),
          width: _dotSize * (additionalSize.width - animation.value).abs(),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
