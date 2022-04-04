part of 'extractallurl_bloc.dart';

class ExtractallurlEvent extends Equatable {
  final String url;
  const ExtractallurlEvent({required this.url});

  @override
  List<Object> get props => [url];
}
