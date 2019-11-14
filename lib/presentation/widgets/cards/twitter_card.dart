import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/utils.dart';
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';

class TwitterCard extends StatelessWidget {
  final Post post;
  final Widget picture;

  const TwitterCard({
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
          onTap: () => LaunchURLUtils.launchURL(post.url.toString()),
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
                                .headline5
                                .copyWith(height: 1),
                          ),
                          Text(
                            DateFormat.yMd().add_Hm().format(
                                  post.created_at.toLocal(),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Container( // TODO: Post image
              //   child: Image.network(
              //     post.profile_image_url_https.toString(),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  post.text,
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    textColor: Colors.blue,
                    onPressed: () =>
                        LaunchURLUtils.launchURL(post.url.toString()),
                    child: Text(AppLoc.of(context).news.seeTwitter),
                  ),
                ),
              ),
              Text(
                post.id.toString(),
                style: TextStyle(fontSize: 5, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
