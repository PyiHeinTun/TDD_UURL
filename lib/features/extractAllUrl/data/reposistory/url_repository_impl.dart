import 'package:flutter/services.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/platform/network_info.dart';
import '../model/url_model.dart';
import '../source/facebook_source.dart';
import '../source/sources.dart';
import '../source/streamtape_source.dart';
import '../../domain/entity/url.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/url_repository.dart';

class UrlRepositoryImpl implements UrlRepository {
  final FacebookSource facebookSource;
  final StreamtapeSource streamtapeSource;
  final NetworkInfo networkInfo;

  UrlRepositoryImpl({
    required this.facebookSource,
    required this.streamtapeSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, URL>> getExtractUrl({required String url}) async {
    //=====TODO check url and find RIGHT PLATFORM
    return _getExtractUrl(sources: Sources.facebook, url: url);
  }

  Future<Either<Failure, URL>> _getExtractUrl(
      {required Sources sources, required String url}) async {
    //=====Check Internet Connection
    if (await networkInfo.isConnected == false) {
      return Left(NetworkFailure());
    }

    //======Extract source from SELECTED PLATFORM
    switch (sources) {
      case Sources.facebook:
        try {
          final URLModel sourceData = await facebookSource.resolveUrl(url: url);
          print(sourceData.sdURL);
          await Clipboard.setData(ClipboardData(text: sourceData.sdURL));
          return Right(sourceData);
        } on InternalException catch (_) {
          return Left(InternalFailure());
        }
      case Sources.streamtape:
        try {
          final URLModel sourceData =
              await streamtapeSource.resolveUrl(url: url);
          return Right(sourceData);
        } on InternalException catch (_) {
          return Left(InternalFailure());
        }

      default:
        return Left(InternalFailure());
    }
  }
}
