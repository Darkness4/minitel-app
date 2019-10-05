import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/core/models/facebook_api/feed.dart';
import 'package:minitel_toolbox/core/models/facebook_api/post.dart';
import 'package:minitel_toolbox/core/services/facebook_api.dart';

class FacebookCard extends StatelessWidget {
  final Post post;
  final Widget picture;

  const FacebookCard({
    @required this.post,
    @required this.picture,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.shortestSide / 2),
      child: Card(
        child: InkWell(
          onTap: () => LaunchURL.launchURL(post.permalinkUrl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: picture,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Minitel Ismin",
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .copyWith(height: 1),
                          ),
                          Text(
                            DateFormat.yMd()
                                .add_Hm()
                                .format(post.createdTime.toLocal()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Image.network(
                  post.pictureUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  post.message,
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    textColor: Colors.blue,
                    onPressed: () => LaunchURL.launchURL(post.permalinkUrl),
                    child: Text(AppLoc.of(context).news.seeFacebook),
                  ),
                ),
              ),
              Text(
                post.id,
                style: TextStyle(fontSize: 5, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FacebookTab extends StatelessWidget {
  const FacebookTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FacebookAPI _facebookAPI = FacebookAPI();
    final Image _picture = Image.network(
      _facebookAPI.profilePicture,
      fit: BoxFit.cover,
      height: 50,
      width: 50,
    );

    return Center(
      child: Scrollbar(
        child: FutureBuilder<Feed>(
          future: _facebookAPI.fetchFeed(),
          builder: (BuildContext context, AsyncSnapshot<Feed> feedSnapshot) {
            if (feedSnapshot.hasError) {
              return const Icon(
                Icons.error,
                color: Colors.white,
                size: 40.0,
              );
            }
            switch (feedSnapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const CircularProgressIndicator(
                  key: Key('facebook_tab/loading'),
                );
              case ConnectionState.done:
                return OrientationBuilder(
                  builder: (BuildContext context, Orientation orientation) {
                    if (MediaQuery.of(context).size.shortestSide < 600 &&
                        orientation == Orientation.portrait) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(10.0),
                        key: const Key('facebook_tab/list'),
                        itemCount: feedSnapshot.data.posts.length,
                        itemBuilder: (BuildContext context, int index) =>
                            FacebookCard(
                          post: feedSnapshot.data.posts[index],
                          picture: _picture,
                          key: Key('facebook_tab/fb_item_$index'),
                        ),
                      );
                    } else {
                      return SingleChildScrollView(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          key: const Key('facebook_tab/list'),
                          children: <Widget>[
                            for (final Post post in feedSnapshot.data.posts)
                              FacebookCard(
                                post: post,
                                picture: _picture,
                              ),
                          ],
                        ),
                      );
                    }
                  },
                );
            }
            return const Icon(
              Icons.error,
              color: Colors.white,
              size: 40.0,
            );
          },
        ),
      ),
    );
  }
}
