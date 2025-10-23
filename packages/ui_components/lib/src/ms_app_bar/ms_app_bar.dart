import 'package:flutter/material.dart';
import 'package:ui_components/src/ms_search_bar/ms_search_bar.dart';

final class MsAppBar extends StatelessWidget implements PreferredSizeWidget {
  MsAppBar({
    this.title,
    this.toolbarHeight,
    this.bottom,
    this.flexibleSpace,
    super.key,
  }) : preferredSize = _PreferredAppBarSize(
         toolbarHeight,
         bottom?.preferredSize.height,
       );

  factory MsAppBar.searchBar({
    String? title,
    double? toolbarHeight,
    Widget? flexibleSpace,
    TextEditingController? controller,
    FocusNode? focusNode,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    Key? key,
  }) {
    return MsAppBar(
      title: title,
      toolbarHeight: toolbarHeight,
      flexibleSpace: flexibleSpace,
      key: key,
      bottom: MsSearchBar(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),
    );
  }

  final String? title;
  final double? toolbarHeight;

  final PreferredSizeWidget? bottom;
  final Widget? flexibleSpace;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final title = this.title;

    return AppBar(
      title: title != null ? Text(title) : null,
      centerTitle: true,
      elevation: 4,
      toolbarHeight: toolbarHeight,
      bottom: bottom,
      flexibleSpace: flexibleSpace,
    );
  }
}

final class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
    : super.fromHeight(
        (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0),
      );

  final double? toolbarHeight;
  final double? bottomHeight;
}
