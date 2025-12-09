part of '../home_screen.dart';

final class _ShakeEffectWidget extends HookWidget {
  const _ShakeEffectWidget({
    required this.child,
    required this.isShaking,
  });

  final Widget child;
  final bool isShaking;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: MsAnimationDurations.long,
    );

    useEffect(
      () {
        if (isShaking) {
          controller.repeat(reverse: true).ignore();
        } else {
          controller.reset();
        }

        return;
      },
      [isShaking],
    );

    return IgnorePointer(
      ignoring: isShaking,
      child: child
          .animate(
            controller: controller,
            autoPlay: false,
          )
          .shake(hz: 4),
    );
  }
}
