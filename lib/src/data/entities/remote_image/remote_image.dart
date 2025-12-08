import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_image.freezed.dart';

@freezed
sealed class RemoteImage with _$RemoteImage {
  const factory RemoteImage({
    required String imagePath,
    required String resolution,
  }) = _RemoteImage;
}
