import 'package:flutter/material.dart';
import 'package:ui_components/src/ms_app_bar/ms_app_bar_theme.dart';
import 'package:ui_components/src/ms_search_bar/ms_search_bar.dart';

final class MsAppBar extends StatelessWidget implements PreferredSizeWidget {
  MsAppBar({
    this.title,
    this.toolbarHeight,
    this.bottom,
    this.flexibleSpace,
    this.backgroundColor,
    this.elevation,
    this.titleTextStyle,
    this.iconTheme,
    this.centerTitle,
    super.key,
  }) : preferredSize = _PreferredAppBarSize(
         toolbarHeight,
         bottom?.preferredSize.height,
       );

  factory MsAppBar.searchBar({
    String? title,
    double? toolbarHeight,
    Widget? flexibleSpace,
    Color? backgroundColor,
    double? elevation,
    TextStyle? titleTextStyle,
    IconThemeData? iconTheme,
    bool? centerTitle,
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
      backgroundColor: backgroundColor,
      elevation: elevation,
      titleTextStyle: titleTextStyle,
      iconTheme: iconTheme,
      centerTitle: centerTitle,
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

  final Color? backgroundColor;
  final double? elevation;
  final TextStyle? titleTextStyle;
  final IconThemeData? iconTheme;
  final bool? centerTitle;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final title = this.title;

    final theme = Theme.of(context).extension<MsAppBarTheme>();
    final backgroundColor = this.backgroundColor ?? theme?.backgroundColor;
    final elevation = this.elevation ?? theme?.elevation;
    final titleTextStyle = this.titleTextStyle ?? theme?.titleTextStyle;
    final iconTheme = this.iconTheme ?? theme?.iconTheme;
    final centerTitle = this.centerTitle ?? theme?.centerTitle ?? false;

    return AppBar(
      title: title != null ? Text(title) : null,
      centerTitle: centerTitle,
      elevation: elevation,
      backgroundColor: backgroundColor,
      titleTextStyle: titleTextStyle,
      iconTheme: iconTheme,
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
