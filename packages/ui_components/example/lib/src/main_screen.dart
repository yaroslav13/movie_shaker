import 'package:example/src/pages/dots_progress_indicator_example/dots_progress_indicator_example_view.dart';
import 'package:example/src/pages/loading_error_stub_example/loading_error_stub_example_view.dart';
import 'package:example/src/pages/movie_card_examples/movie_card_examples_view.dart';
import 'package:example/src/pages/movie_carousel_example/movie_carousel_example_view.dart';
import 'package:example/src/pages/movie_collection_card_example/movie_collection_card_example_view.dart';
import 'package:example/src/pages/ms_bottom_bar_example/ms_bottom_bar_example_view.dart';
import 'package:example/src/pages/ms_floating_app_bar_example/ms_floating_app_bar_example_view.dart';
import 'package:example/src/pages/ms_list_tile_example/ms_list_tile_example_view.dart';
import 'package:example/src/pages/ms_progress_indicator_example/ms_progress_indicator_example_view.dart';
import 'package:example/src/pages/no_items_stub_example/no_items_stub_example_view.dart';
import 'package:example/src/pages/refresh_indicator_example/refresh_indicator_example_view.dart';
import 'package:example/src/pages/segmented_row_example/segmented_row_example_view.dart';
import 'package:example/src/pages/text_form_field_example/text_form_field_example_view.dart';
import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';

final class MainScreen extends StatefulWidget {
  const MainScreen({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final class _MainScreenState extends State<MainScreen> {
  final _destinations = <Widget>[
    const MovieCardExamplesView(),
    const DotsProgressIndicatorExampleView(),
    const LoadingErrorStubExampleView(),
    const MsProgressIndicatorExampleView(),
    const MsListTileExampleView(),
    const NoItemsStubExampleView(),
    const RefreshIndicatorExampleView(),
    const TextFormFieldExampleView(),
    const MsFloatingAppBarExampleView(),
    const SegmentedRowExampleView(),
    const MsBottomBarExampleView(),
    const MovieCarouselExampleView(),
    const MovieCollectionCardExampleView(),
  ];

  String _getWidgetTitle(Widget widget) {
    if (widget is LabeledWidgetMixin) {
      return (widget as LabeledWidgetMixin).label;
    }

    return '$widget';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(
        children: _destinations
            .map(
              (widget) => ListTile(
                title: Text(_getWidgetTitle(widget)),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (_) => widget),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
