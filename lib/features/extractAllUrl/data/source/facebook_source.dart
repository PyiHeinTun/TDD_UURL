import 'package:http/http.dart';

import '../../../../core/error/exception.dart';
import '../model/url_model.dart';
import 'sources.dart';

abstract class FacebookSource {
  /// Extract Data of Facebook Url.
  ///
  /// Throws a [InternalException] for all error codes.

  Future<URLModel> resolveUrl({required String url});
}

class FacebookSourceImpl implements FacebookSource {
  @override
  Future<URLModel> resolveUrl({required String url}) async {
    Client _client = Client();
    Response _response;
    try {
      _response = await _client.get(Uri.parse(url), headers: {
        'accept':
            'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
        'user-agent':
            'Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.188 Safari/537.36 CrKey/1.54.250320',
      });
    } catch (error) {
      throw InternalException();
    }

    return URLModel.fromJson({
      "videoSdUrl": getSdLink(_response.body),
      "videoHdUrl": '',
    }, Sources.facebook);
  }
}

String getSdLink(String body) {
  const start = '"playable_url":"';
  const end = '",';
  final startIndex = body.indexOf(start);
  final endIndex = body.indexOf(end, startIndex + start.length);
  String sdUrl = body.substring(startIndex + start.length, endIndex);
  // sdUrl =
  //     'https:\/\/video-sin6-2.xx.fbcdn.net\/v\/t39.25447-2\/276324447_1802314426628755_7484353365749725247_n.mp4?_nc_cat=105&vs=ae405d2eafa3a680&_nc_vs=HBksFQAYJEdGOWdlQkNUT2l3SE1tY0dBRC00QW51N3c5MW5ibWRqQUFBRhUAAsgBABUAGCRHRUFyZ2hESF9nRXFjYU1EQVBYQUZyZ2U3NG8xYnJGcUFBQUYVAgLIAQBLBogScHJvZ3Jlc3NpdmVfcmVjaXBlATENc3Vic2FtcGxlX2ZwcwAQdm1hZl9lbmFibGVfbnN1YgAgbWVhc3VyZV9vcmlnaW5hbF9yZXNvbHV0aW9uX3NzaW0AKGNvbXB1dGVfc3NpbV9vbmx5X2F0X29yaWdpbmFsX3Jlc29sdXRpb24AEWRpc2FibGVfcG9zdF9wdnFzABUAJQAcAAAmoPvX\u00252BLzjoAIVAigCQzMYC3Z0c19wcmV2aWV3HBdAYl3S8an75xggZGFzaF92NF81c2VjZ29wX2hxMV9mcmFnXzJfdmlkZW8SABgYdmlkZW9zLnZ0cy5jYWxsYmFjay5wcm9kOBJWSURFT19WSUVXX1JFUVVFU1QbCYgVb2VtX3RhcmdldF9lbmNvZGVfdGFnBm9lcF9zZBNvZW1fcmVxdWVzdF90aW1lX21zATAMb2VtX2NmZ19ydWxlCnNkX3VubXV0ZWQTb2VtX3JvaV9yZWFjaF9jb3VudAUzMjM5ORFvZW1faXNfZXhwZXJpbWVudAAMb2VtX3ZpZGVvX2lkDzcwOTcyNTI3MzM2NjY5MRJvZW1fdmlkZW9fYXNzZXRfaWQPNjc5MzM4NzQzMzE0NDkzFW9lbV92aWRlb19yZXNvdXJjZV9pZA82MzUwMjc2ODQyNjE1ODQcb2VtX3NvdXJjZV92aWRlb19lbmNvZGluZ19pZBA3Mjg2MjQ5MzM0NzUwNjAxJQIcACXEARsHiAFzBDYyMDICY2QKMjAyMi0wMy0yMANyY2IFMzIzMDADYXBwFEZhY2Vib29rIGZvciBBbmRyb2lkAmN0GUNPTlRBSU5FRF9QT1NUX0FUVEFDSE1FTlQTb3JpZ2luYWxfZHVyYXRpb25fcw8xNTEuMjMxODE5Mjg4OTMCdHMUcHJvZ3Jlc3NpdmVfb3JkZXJpbmcA&ccb=1-5&_nc_sid=894f7d&efg=eyJ2ZW5jb2RlX3RhZyI6Im9lcF9zZCJ9&_nc_ohc=eRiHWmwabwEAX-Obmc9&_nc_ht=video-sin6-2.xx&oh=00_AT92aVlCeKmjotap5oUgCftL2zqGMsO7HcVzTUwV7o_D_g&oe=624567C3&_nc_rid=177394356374583';

  return sdUrl.replaceAll(r'\/', r'/') + '&dl=1';
}
