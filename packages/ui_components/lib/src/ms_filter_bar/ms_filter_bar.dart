import 'package:flutter/material.dart';
import 'package:ui_components/src/ms_filter_bar/ms_filter_chip.dart';
import 'package:ui_components/src/shared/ms_spacings.dart';

const _filterBarHeight = 80.0;

final class MsFilterBar<T> extends StatefulWidget
    implements PreferredSizeWidget {
  const MsFilterBar({
    required this.items,
    required this.labelBuilder,
    this.selectedItem,
    this.onSelected,
    this.padding,
    super.key,
  });

  final List<T> items;
  final T? selectedItem;

  final String Function(BuildContext context, T item) labelBuilder;
  final ValueChanged<T>? onSelected;

  final EdgeInsetsGeometry? padding;

  @override
  State<MsFilterBar<T>> createState() => _MsFilterBarState<T>();

  @override
  Size get preferredSize => const Size.fromHeight(_filterBarHeight);
}

final class _MsFilterBarState<T> extends State<MsFilterBar<T>> {
  final _selectedItemNotifier = ValueNotifier<T?>(null);

  void _onItemSelected(T item) {
    if (_selectedItemNotifier.value == item) {
      _selectedItemNotifier.value = null;

      return;
    }

    _selectedItemNotifier.value = item;
    widget.onSelected?.call(item);
  }

  @override
  void initState() {
    super.initState();

    _selectedItemNotifier.value = widget.selectedItem;
  }

  @override
  void didUpdateWidget(covariant MsFilterBar<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedItem != oldWidget.selectedItem) {
      _selectedItemNotifier.value = widget.selectedItem;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.preferredSize.height,
      child: ValueListenableBuilder<T?>(
        valueListenable: _selectedItemNotifier,
        builder: (context, selectedValue, child) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: widget.padding,
            itemCount: widget.items.length,
            separatorBuilder: (_, __) =>
                const SizedBox(width: MsSpacings.regular),
            itemBuilder: (context, index) {
              final item = widget.items[index];
              final selected = selectedValue == item;
              final label = widget.labelBuilder(context, item);

              return Align(
                child: MsFilterChip.text(
                  label,
                  selected: selected,
                  onSelected: (_) => _onItemSelected(item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
