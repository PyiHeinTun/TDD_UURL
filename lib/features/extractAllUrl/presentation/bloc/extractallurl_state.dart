part of 'extractallurl_bloc.dart';

abstract class ExtractallurlState extends Equatable {
  const ExtractallurlState();

  @override
  List<Object> get props => [];
}

class UrlError extends ExtractallurlState {
  final String message;
  const UrlError({required this.message});

  @override
  List<Object> get props => [message];
}

class UrlLoading extends ExtractallurlState {}

class UrlLoaded extends ExtractallurlState {
  final URL extractUrl;
  const UrlLoaded({required this.extractUrl});

  @override
  List<Object> get props => [extractUrl];
}
