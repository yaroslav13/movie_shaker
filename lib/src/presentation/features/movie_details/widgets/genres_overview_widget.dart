part of '../movie_details_screen.dart';

final class _GenresOverviewWidget extends StatelessWidget {
  const _GenresOverviewWidget({
    required this.genres,
  });

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MsCard(
      backgroundColor: colorScheme.primaryFixed,
      margin: MsEdgeInsets.zero,
      borderRadius: MsBorderRadius.round,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: MsEdgeInsets.contentLarge,
        child: Column(
          spacing: MsSpacings.regular,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MsCard(
              margin: MsEdgeInsets.zero,
              child: Padding(
                padding: MsEdgeInsets.contentMedium,
                child: MsText.titleMedium(
                  context,
                  context.localizations.genres.toUpperCase(),
                ),
              ),
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
        ),
      ),
    );
  }
}
