import 'package:contentchef_dart/contentchef_dart.dart';

class _ContentChefClient {
  Configuration _config = Configuration(spaceId: 'your-spaceId');
  Media _media;
  OnlineChannel _onlineChannel;

  _ContentChefClient() {
    this._media = Media();
    this._onlineChannel = ContentChef(configuration: _config).getOnlineChannel(
        apiKey: 'your-api-key', publishingChannel: 'your-channel-mnemonicId');
  }

  Future<List<ContentResponse<T>>> searchContents<T>(
      {SearchContentsFilters filters, FromJsonDef<T> fromJson}) async {
    try {
      PaginatedResponse<T> result = await this
          ._onlineChannel
          .searchContents<T>(filters: filters, fromJson: fromJson);
      return result.items;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<T> getContent<T>(
      {GetContentFilters filters, FromJsonDef<T> fromJson}) async {
    try {
      ContentResponse<T> result = await this
          ._onlineChannel
          .getContent<T>(filters: filters, fromJson: fromJson);
      return result.payload;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  getImageUrl({String publicId, MediaTransformations transformations}) {
    var publicUrl = this
        ._media
        .imageUrl(publicId: publicId, transformations: transformations);
    return publicUrl;
  }
}

final contentChefClient = _ContentChefClient();
