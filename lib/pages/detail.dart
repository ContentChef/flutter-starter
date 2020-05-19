import 'package:contentchef_dart/contentchef_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/Components/topSiteCard.dart';
import 'package:flutter_starter/mappers/contentchef_top_site.dart';
import 'package:flutter_starter/services/contentchef_client.dart';

class DetailsPage extends StatefulWidget {
  final String publicId;
  DetailsPage({ Key key, @required this.publicId }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<TopSiteContent> futureTopSite;

  @override
  void initState(){
    super.initState();
    futureTopSite = contentChefClient.getContent<TopSiteContent>(
      filters: GetContentFilters(publicId: widget.publicId),
      fromJson: TopSiteContent.fromJson
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('One of the best Site'),
      ),
      body: Center(
        child: FutureBuilder<TopSiteContent>(
          future: futureTopSite,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(
                child: Text('An error occurred retrieving your content ${widget.publicId}'),
              );
            } else if (snapshot.hasData) {
              return TopSiteCard(
                title: snapshot.data.title,
                description: snapshot.data.description,
                image: snapshot.data.image,
                url: snapshot.data.url
              );
            }
            return CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}