part of '../movie_details_screen.dart';

final class _GenresOverviewWidget extends StatelessWidget {
  const _GenresOverviewWidget({
    required this.genres,
  });

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          children: genres
              .map(
                (genre) => GenreCard(
                  margin: MsEdgeInsets.contentSmall,
                  genre: genre.name.toUpperCase(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
