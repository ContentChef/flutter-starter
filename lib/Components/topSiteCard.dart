import 'package:contentchef_dart/contentchef_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_starter/services/contentchef_client.dart';

class TopSiteCard extends StatelessWidget {
  final String title;
  final String description;
  final String url;
  final String image;

  TopSiteCard({
    @required this.title,
    @required this.description,
    @required this.url,
    @required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
          child: Image.network(contentChefClient.getImageUrl(
              publicId: this.image,
              transformations: MediaTransformations(mediaHeight: 80, mediaWidth: 80)
          )),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Text(this.title)
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Text(this.description)
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Text(this.url)
        ),
      ],
    );
  }
}