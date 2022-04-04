import 'package:web_scraper/web_scraper.dart';

import '../model/url_model.dart';

abstract class StreamtapeSource {
  /// Extract Data of Facebook Url.
  ///
  /// Throws a [InternalException] for all error codes.

  Future<URLModel> resolveUrl({required String url});
}

class StreamtapeSourceImpl implements StreamtapeSource {
  @override
  Future<URLModel> resolveUrl({required String url}) async {
    final webScraper = WebScraper(
        'https://streamtape.com/e/XPLVRBR8BVCDDY9/Don_Omar_-_Danza_Kuduro_%7C_REMIX_%7C_Long_Version.mp4');

    //TODO Complete StreamTape Content
    if (await webScraper.loadWebPage('/')) {
      // List<Map<String, dynamic>> elements =
      //     webScraper.getElement('div#robotlink', ['href']);
    }
    throw UnimplementedError();
  }
}
