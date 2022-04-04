import '../source/sources.dart';
import '../../domain/entity/url.dart';

class URLModel extends URL {
  const URLModel({
    required String sdURL,
    required String hdURL,
    required Sources sources,
  }) : super(sources: sources, hdURL: hdURL, sdURL: sdURL);

  factory URLModel.fromJson(Map<String, dynamic> json, Sources source) {
    return URLModel(
      sdURL: json['videoSdUrl'],
      sources: source,
      hdURL: json['videoHdUrl'],
    );
  }
}
