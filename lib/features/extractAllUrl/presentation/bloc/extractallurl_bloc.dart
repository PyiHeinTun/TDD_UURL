import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entity/url.dart';
import '../../domain/useCase/get_extract_url.dart';

part 'extractallurl_event.dart';
part 'extractallurl_state.dart';

class ExtractallurlBloc extends Bloc<ExtractallurlEvent, ExtractallurlState> {
  final GetExtractUrl getExtractUrlImpl;
  ExtractallurlBloc({required this.getExtractUrlImpl})
      : super(UrlError(message: _mapFailureToMessage(InternalFailure()))) {
    on<ExtractallurlEvent>((event, emit) async {
      emit(UrlLoading());
      final extractUrl = await getExtractUrlImpl(Params(url: event.url));
      extractUrl.fold(
        (l) => emit(UrlError(message: _mapFailureToMessage(l))),
        (r) => emit(UrlLoaded(extractUrl: r)),
      );
    });
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case InternalFailure:
      return 'Please Select One of the Following Site \n 1. facebook.com  \n 2. streamtape.com';
    case NetworkFailure:
      return 'Please Make Sure You Have an Active Internet Connection';
    default:
      return 'Unknown Error';
  }
}
