part of 'movie_carousel.dart';

final class MovieCarouselController {
  MovieCarouselController();

  _MovieCarouselState? _carouselState;

  // ignore: use_setters_to_change_properties
  void _attach(_MovieCarouselState anchor) {
    _carouselState = anchor;
  }

  void _detach(_MovieCarouselState anchor) {
    if (_carouselState == anchor) {
      _carouselState = null;
    }
  }

  Future<void> animateToItem(
    int index, {
    Duration duration = MsAnimationDurations.medium,
  }) async {
    await _carouselState?._carouselController.animateToItem(
      index,
      duration: duration,
      curve: Curves.easeInOut,
    );
  }
}
