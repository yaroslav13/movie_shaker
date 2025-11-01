import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class SegmentedRow extends StatelessWidget {
  const SegmentedRow({
    required this.segments,
    this.segmentLabelStyle,
    this.segmentCaptionStyle,
    this.segmentContentPadding,
    this.dividerColor,
    this.dividerRadius,
    this.dividerWidth,
    this.dividerThickness,
    this.dividerIndent,
    this.dividerEndIndent,
    super.key,
  });

  final List<SegmentData> segments;

  final TextStyle? segmentLabelStyle;
  final TextStyle? segmentCaptionStyle;
  final EdgeInsetsGeometry? segmentContentPadding;

  final double? dividerWidth;
  final double? dividerThickness;
  final double? dividerIndent;
  final double? dividerEndIndent;
  final Color? dividerColor;
  final BorderRadiusGeometry? dividerRadius;

  Iterable<Widget> _buildSegmentedRow([SegmentedRowTheme? theme]) sync* {
    final dividerTheme = theme?.dividerTheme;
    final segmentTheme = theme?.segmentTheme;

    final segmentLabelStyle =
        this.segmentLabelStyle ?? segmentTheme?.labelStyle;
    final segmentCaptionStyle =
        this.segmentCaptionStyle ?? segmentTheme?.captionStyle;
    final segmentContentPadding =
        this.segmentContentPadding ?? segmentTheme?.contentPadding;

    final dividerColor = this.dividerColor ?? dividerTheme?.color;
    final dividerWidth = this.dividerWidth ?? dividerTheme?.space;
    final dividerThickness = this.dividerThickness ?? dividerTheme?.thickness;
    final dividerIndent = this.dividerIndent ?? dividerTheme?.indent;
    final dividerEndIndent = this.dividerEndIndent ?? dividerTheme?.endIndent;
    final dividerRadius = this.dividerRadius ?? dividerTheme?.radius;

    for (final segment in segments) {
      yield _Segment(
        data: segment,
        contentPadding: segmentContentPadding,
        labelStyle: segmentLabelStyle,
        captionStyle: segmentCaptionStyle,
      );
      if (segment != segments.last) {
        yield VerticalDivider(
          color: dividerColor,
          width: dividerWidth,
          thickness: dividerThickness,
          indent: dividerIndent,
          radius: dividerRadius,
          endIndent: dividerEndIndent,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SegmentedRowTheme>();

    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ..._buildSegmentedRow(theme),
        ],
      ),
    );
  }
}

final class _Segment extends StatelessWidget {
  const _Segment({
    required this.data,
    this.contentPadding,
    this.labelStyle,
    this.captionStyle,
  });

  final SegmentData data;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? labelStyle;
  final TextStyle? captionStyle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: contentPadding ?? MsEdgeInsets.regularContent,
        child: Column(
          spacing: MsSpacings.xxSmall,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ?data.icon,
            if (data.label case final label?) MsText(label, style: labelStyle),
            if (data.caption case final caption?)
              MsText(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
