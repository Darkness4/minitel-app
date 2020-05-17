import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:minitel_toolbox/domain/entities/github/release.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/blocs/github_releases/github_releases_bloc.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:minitel_toolbox/presentation/widgets/cards/github_card.dart';

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

  BlocProvider<GithubReleasesBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GithubReleasesBloc>(),
      child: Center(
        child: BlocBuilder<GithubReleasesBloc, GithubReleasesState>(
          builder: (BuildContext context, GithubReleasesState state) {
            if (state is GithubReleasesStateInitial) {
              return const InitialDisplay();
            } else if (state is GithubReleasesStateLoading) {
              return const CircularProgressIndicator(
                  key: Key(Keys.newsLoading));
            } else if (state is GithubReleasesStateLoaded) {
              return GithubReleasesDisplay(releases: state.releases);
            } else if (state is GithubReleasesStateError) {
              return ErrorDisplay(
                message: state.error.toString(),
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}

class InitialDisplay extends StatelessWidget {
  const InitialDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .bloc<GithubReleasesBloc>()
        .add(const GetReleasesEvent(ApiKeys.githubRepo));
    return const CircularProgressIndicator(key: Key(Keys.newsLoading));
  }
}
