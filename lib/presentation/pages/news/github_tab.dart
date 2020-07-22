import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:minitel_toolbox/domain/entities/github/release.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/cubits/news/github_releases/github_releases_cubit.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:minitel_toolbox/presentation/pages/news/news_widget/github_card.dart';

class ErrorDisplay extends StatelessWidget {
  final String message;
  const ErrorDisplay({
    @required this.message,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.error,
          color: Colors.white,
          size: 40.0,
        ),
        Text(message),
      ],
    );
  }
}

class GithubReleasesDisplay extends StatelessWidget {
  final List<GithubRelease> releases;

  const GithubReleasesDisplay({
    @required this.releases,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (MediaQuery.of(context).size.shortestSide < 600 &&
            orientation == Orientation.portrait) {
          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            key: const Key(Keys.githubList),
            itemCount: releases.length,
            itemBuilder: (BuildContext context, int index) => GithubCard(
              release: releases[index],
              key: Key(Keys.githubItem(index)),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Wrap(
              key: const Key(Keys.githubList),
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                for (final GithubRelease release in releases)
                  GithubCard(release: release),
              ],
            ),
          );
        }
      },
    );
  }
}

class GithubScreen extends StatelessWidget {
  const GithubScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<GithubReleasesCubit>()..getReleases((ApiKeys.githubRepo)),
      child: Center(
        child: BlocBuilder<GithubReleasesCubit, GithubReleasesState>(
          builder: (BuildContext context, GithubReleasesState state) {
            return state.when(
              initial: () =>
                  const CircularProgressIndicator(key: Key(Keys.newsLoading)),
              loading: () =>
                  const CircularProgressIndicator(key: Key(Keys.newsLoading)),
              loaded: (releases) => GithubReleasesDisplay(releases: releases),
              error: (error) => ErrorDisplay(message: error.toString()),
            );
          },
        ),
      ),
    );
  }
}
