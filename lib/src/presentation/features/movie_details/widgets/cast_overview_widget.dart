part of '../movie_details_screen.dart';

final class _CastOverviewWidget extends StatelessWidget {
  const _CastOverviewWidget({
    required this.cast,
  });

  final List<CastMember> cast;

  @override
  Widget build(BuildContext context) {
    return MsCard(
      margin: MsEdgeInsets.zero,
      borderRadius: MsBorderRadius.round,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: MsEdgeInsets.contentLarge,
        child: Column(
          spacing: MsSpacings.regular,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            MsCard(
              margin: MsEdgeInsets.zero,
              child: Padding(
                padding: MsEdgeInsets.contentMedium,
                child: MsText.titleMedium(
                  context,
                  context.localizations.cast.toUpperCase(),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 1.4,
              child: MsCarousel(
                elevation: 0,
                itemFraction: 0.65,
                enableSplash: false,
                itemCount: cast.length,
                itemBuilder: (con5text, index) {
                  final castMember = cast[index];

                  return ContributorCard(
                    photoUrl: castMember.photoUrl,
                    name: castMember.name,
                    character: castMember.character,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
