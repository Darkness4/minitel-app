import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/core/models/facebook_api/feed.dart';
import 'package:minitel_toolbox/core/models/facebook_api/post.dart';
import 'package:minitel_toolbox/core/services/http_facebook_api.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class FacebookTab extends StatelessWidget {
  const FacebookTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _facebookAPI = Provider.of<FacebookAPI>(context);
    final _picture = Image.network(
      _facebookAPI.getProfilePicture(),
      fit: BoxFit.cover,
      height: 50,
      width: 50,
    );

    return Center(
      child: Scrollbar(
        child: FutureBuilder<Feed>(
          future: _facebookAPI.getFeed(),
          builder: (context, feedSnapshot) {
            switch (feedSnapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const CircularProgressIndicator(
                  key: Key('facebook_tab/loading'),
                );
              case ConnectionState.done:
                if (feedSnapshot.hasError) {
                  return const Icon(
                    Icons.error,
                    color: Colors.white,
                    size: 40.0,
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    key: const Key('facebook_tab/list'),
                    itemCount: feedSnapshot.data.posts.length,
                    itemBuilder: (context, index) => FacebookCard(
                      post: feedSnapshot.data.posts[index],
                      picture: _picture,
                      key: Key('facebook_tab/fb_item_$index'),
                    ),
                  );
                }
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

class FacebookCard extends StatelessWidget {
  const FacebookCard({
    Key key,
    @required this.post,
    @required this.picture,
  }) : super(key: key);

  final Post post;
  final Widget picture;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  child: Text("Voir sur Facebook ..."),
                  onPressed: () => LaunchURL.launchURL(post.permalinkUrl),
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
    );
  }
}
