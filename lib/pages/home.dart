import 'package:contentchef_dart/contentchef_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/detail.dart';
import 'package:flutter_starter/services/contentchef_client.dart';
import 'package:flutter_starter/mappers/contentchef_top_site.dart';

class Home extends StatefulWidget {
  Home({ Key key }) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<Home> {
  final SearchContentsFilters searchFilters = SearchContentsFilters(
      skip: 0, take: 10, contentDefinition: ['top-site']);
  Future<List<ContentResponse<TopSiteContent>>> futureTopSites;

  @override
  void initState() {
    super.initState();
    futureTopSites = contentChefClient.searchContents<TopSiteContent>(
        filters: searchFilters, fromJson: TopSiteContent.fromJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to ContentChef + Flutter starter'),
      ),
      body: Center(
        child: FutureBuilder<List<ContentResponse<TopSiteContent>>>(
          future: futureTopSites,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container();
            } else if (snapshot.hasData) {
              return ListView.separated(
                padding: const EdgeInsets.all(10),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  ContentResponse<TopSiteContent> topSite = snapshot.data[index];
                  return ListTile(
                    leading: Image.network(contentChefClient.getImageUrl(
                        publicId: topSite.payload.image)),
                    title: Text(topSite.payload.title),
                    subtitle: Text(topSite.payload.description),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(publicId: topSite.publicId),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              );
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}