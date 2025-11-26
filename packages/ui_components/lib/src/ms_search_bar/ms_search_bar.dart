import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:localization/localization.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_icon_button/ms_icon_button.dart';
import 'package:ui_components/src/ms_text_form_field/ms_text_form_field.dart';

const _searchBarHeight = 80.0;

final class MsSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const MsSearchBar({
    super.key,
    this.focusNode,
    this.controller,
    this.onChanged,
    this.onSubmitted,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  State<MsSearchBar> createState() => _MsSearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(_searchBarHeight);
}

final class _MsSearchBarState extends State<MsSearchBar> {
  final _searchBarClearnessNotifier = ValueNotifier<bool>(false);

  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  late void Function() _controllerListener;

  void _onClearButtonPressed() {
    _controller.clear();
    _focusNode.unfocus();
  }

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();

    _controllerListener = () {
      final isClearButtonVisible = _controller.text.isNotEmpty;

      if (_searchBarClearnessNotifier.value != isClearButtonVisible) {
        _searchBarClearnessNotifier.value = isClearButtonVisible;
      }
    };

    _controller.addListener(_controllerListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_controllerListener);

    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    if (widget.controller == null) {
      _controller.dispose();
    }

    _searchBarClearnessNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MsEdgeInsets.contentMedium,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TapRegion(
              onTapOutside: (_) => _focusNode.unfocus(),
              child: MsTextFormField(
                focusNode: _focusNode,
                controller: _controller,
                hintText: context.localizations.search,
                onFieldSubmitted: widget.onSubmitted,
                onChanged: widget.onChanged,
                prefixIcon: const Icon(HugeIcons.strokeRoundedSearch01),
                textInputAction: TextInputAction.search,
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _searchBarClearnessNotifier,
            builder: (context, value, child) {
              return AnimatedSwitcher(
                duration: MsAnimationDurations.medium,
                child: value
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: MsSpacings.regular,
                        ),
                        child: child,
                      )
                    : const SizedBox.shrink(),
              );
            },
            child: MsIconButton.close(
              padding: MsEdgeInsets.contentSmall,
              onPressed: _onClearButtonPressed,
            ),
          ),
        ],
      ),
    );
  }
}
