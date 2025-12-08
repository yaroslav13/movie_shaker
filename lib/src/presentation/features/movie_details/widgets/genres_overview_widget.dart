part of '../movie_details_screen.dart';

final class _GenresOverviewWidget extends StatelessWidget {
  const _GenresOverviewWidget({
    required this.genres,
  });

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: MsSpacings.regular,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MsText.displayMedium(
          context,
          context.localizations.genres.toUpperCase(),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: IntrinsicHeight(
            child: Row(
              children: genres
                  .map(
                    (genre) => GenreCard(
                      margin: genres.first == genre
                          ? EdgeInsets.only(
                              right: MsEdgeInsets.horizontalSmall.right,
                            )
                          : MsEdgeInsets.horizontalSmall,
                      genre: genre.name.toUpperCase(),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
