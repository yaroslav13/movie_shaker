import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class GlassmorphicCardExampleView extends StatelessWidget
    with LabeledWidgetMixin {
  const GlassmorphicCardExampleView({super.key});

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Glassmorphic Card Tapped!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MsAppBar(title: MsText(label)),
      body: Stack(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmF0dXJlfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: GlassmorphicCard(
                onTap: () => _showSnackBar(context),
                child: Center(
                  child: MsText(
                    'This is a Glassmorphic Card',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  String get label => 'Glassmorphic Card Example';
}
