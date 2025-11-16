import 'package:flutter/material.dart';
import 'package:ui_components/src/ms_filter_bar/ms_filter_chip.dart';
import 'package:ui_components/src/shared/ms_spacings.dart';

const _filterBarHeight = 80.0;

final class MsFilterBar<T> extends StatelessWidget
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
  final ValueChanged<T?>? onSelected;

  final EdgeInsetsGeometry? padding;

  void _onItemSelected(T item) {
    onSelected?.call(selectedItem == item ? null : item);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: MsSpacings.regular),
        itemBuilder: (context, index) {
          final item = items[index];
          final selected = selectedItem == item;
          final label = labelBuilder(context, item);

          return Align(
            child: MsFilterChip.text(
              label,
              selected: selected,
              onSelected: (_) => _onItemSelected(item),
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_filterBarHeight);
}
