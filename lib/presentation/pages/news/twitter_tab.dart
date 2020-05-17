import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/domain/entities/twitter/feed.dart';
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/blocs/twitter_feed/twitter_feed_bloc.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:minitel_toolbox/presentation/widgets/cards/twitter_card.dart';

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

class TwitterScreen extends StatelessWidget {
  const TwitterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocProvider<TwitterFeedBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TwitterFeedBloc>(),
      child: Center(
        child: BlocBuilder<TwitterFeedBloc, TwitterFeedState>(
          builder: (BuildContext context, TwitterFeedState state) {
            if (state is TwitterFeedStateInitial) {
              return const InitialDisplay();
            } else if (state is TwitterFeedStateLoading) {
              return const CircularProgressIndicator(
                  key: Key(Keys.newsLoading));
            } else if (state is TwitterFeedStateLoaded) {
              return FeedDisplay(feed: state.feed);
            } else if (state is TwitterFeedStateError) {
              return ErrorDisplay(message: state.error.toString());
            }
            return null;
          },
        ),
      ),
    );
  }
}

class FeedDisplay extends StatelessWidget {
  final Feed feed;
  const FeedDisplay({
    @required this.feed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Image imageProfile = _imageProfile();
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (MediaQuery.of(context).size.shortestSide < 600 &&
            orientation == Orientation.portrait) {
          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            key: const Key(Keys.twitterList),
            itemCount: feed.posts.length,
            itemBuilder: (BuildContext context, int index) => TwitterCard(
              post: feed.posts[index],
              picture: imageProfile,
              key: Key(Keys.twitterItem(index)),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              key: const Key(Keys.twitterList),
              children: <Widget>[
                for (final Post post in feed.posts)
                  TwitterCard(
                    post: post,
                    picture: imageProfile,
                  ),
              ],
            ),
          );
        }
      },
    );
  }

  Image _imageProfile() {
    final Image imageProfile = Image.network(
      feed.posts.first.profile_image_url_https.toString(),
      fit: BoxFit.cover,
      height: 50,
      width: 50,
    );
    return imageProfile;
  }
}

class InitialDisplay extends StatelessWidget {
  const InitialDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.bloc<TwitterFeedBloc>().add(const GetFeedEvent());
    return const CircularProgressIndicator(
      key: Key(Keys.newsLoading),
    );
  }
}
