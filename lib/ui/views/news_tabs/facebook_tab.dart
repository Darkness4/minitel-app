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
    var pictureUrl = Provider.of<FacebookAPI>(context).getProfilePicture();
    return Center(
      child: Scrollbar(
        child: FutureBuilder<Feed>(
          future: Provider.of<FacebookAPI>(context).getFeed(),
          builder: (context, feedSnapshot) => feedSnapshot.hasData
              ? ListView(
                  padding: const EdgeInsets.all(10.0),
                  children: <Widget>[
                    for (Post post in feedSnapshot.data.posts)
                      FacebookCard(
                        post: post,
                        pictureUrl: pictureUrl,
                      ),
                  ],
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class FacebookCard extends StatelessWidget {
  const FacebookCard({
    Key key,
    @required this.post,
    @required this.pictureUrl,
  }) : super(key: key);

  final Post post;
  final String pictureUrl;

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
                    child: Image.network(
                      pictureUrl,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
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
                  child: Text(
                    "Voir sur Facebook ..."
                  ),
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
