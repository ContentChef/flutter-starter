<div align="center">
  <img src="images/contentchef_logo.svg" height="64"/>
</div>

Flutter Starter for [ContentChef - Headless CMS](https://www.contentchef.io/)
=============================================================================

[ContentChef](https://www.contentchef.io/) is an Headless CMS designed to accelerate the development of modern,cross channel digital products.

This starter is a simple [Flutter](https://flutter.dev/) integrated with our Delivery API using the [ContentChef Dart SDK](https://github.com/ContentChef/contentchef-dart)

# Requirements

In order to use make this starter work, you will need

* An active ContentChef account (sign up for a 30-day free trial [here](https://www.contentchef.io/registration))
* Dart >=2.7.0 <3.0.0
* Flutter >= 10.13 1.17.0

# Clone & Installation

Clone the starter repo and install all the deps

```bash
    git clone https://github.com/ContentChef/flutter-starter.git
    cd flutter_starter
    pub get
```

Get your SpaceID, Online API Key from your dashboard home page.

![ContentChef Dashboard - Home](https://res.cloudinary.com/contentchef/image/upload/v1/chefsite-2910/I49Zi00Uf7S/spaceid)

Open `./lib/services/contentchef_client.dart` and copy your data in the client configuration and use "example-ch" for your channel now.

```javascript
class _ContentChefClient {
  Configuration _config = Configuration(spaceId: 'YOUR_SPACEID_GOES_HERE');
  Media _media;
  OnlineChannel _onlineChannel;

  _ContentChefClient() {
    this._media = Media();
    this._onlineChannel = ContentChef(configuration: _config).getOnlineChannel(apiKey: 'YOUR_APIKEY_GOES_HERE', publishingChannel: 'example-ch');
  }
  
  ...
}

```

You are now ready to start the flutter project:

- with [Android Studio and IntelliJ](https://flutter.dev/docs/get-started/test-drive?tab=androidstudio#run-the-app)
- with [VS code](https://flutter.dev/docs/get-started/test-drive?tab=vscode#run-the-app-1)
- with [Terminal & Editor](https://flutter.dev/docs/get-started/test-drive?tab=terminal#run-the-app-2)

Enjoy!

To Learns More
===========================

* [ContentChef Website](https://wwww.contentchef.io)
* [ContentChef Docs](https://docs.contentchef.io)
* [ContentChef Blog](https://www.contentchef.io/blog)
* [Flutter Documentation](https://flutter.dev/docs) - learn about Flutter features and API.
* [Flutter Lab](https://flutter.dev/docs/get-started/codelab) - Write your first Flutter app.
* [Flutter Cookbook)](https://flutter.dev/docs/cookbook) - useful Flutter samples.
* [Dart Documentation](https://nextjs.org/learn) - an interactive Next.js tutorial.
