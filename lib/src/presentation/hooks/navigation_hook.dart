import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

void useNavigationExtraEffect<T>(
  void Function(T extra) onExtra,
) {
  final context = useContext();
  final extra = GoRouterState.of(context).extra;

  useEffect(
    () {
      if (extra is T) {
        Future<void>(
          () => onExtra(extra),
        ).ignore();
      }

      return;
    },
    [extra],
  );
}
