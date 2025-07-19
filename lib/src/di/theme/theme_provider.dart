import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui_components/ui_components.dart';

part 'theme_provider.g.dart';

@riverpod
ThemeData lightTheme(Ref ref) {
  return MsTheme.light();
}
