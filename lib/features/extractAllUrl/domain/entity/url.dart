import 'package:equatable/equatable.dart';

import '../../data/source/sources.dart';

class URL extends Equatable {
  final String sdURL;
  final String hdURL;
  final Sources sources;

  const URL({
    required this.sdURL,
    required this.sources,
    required this.hdURL,
  });

  @override
  List<Object?> get props => [sdURL, hdURL, sources];
}
