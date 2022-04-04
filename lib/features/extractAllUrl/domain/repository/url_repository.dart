import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/url.dart';

abstract class UrlRepository {
  Future<Either<Failure, URL>> getExtractUrl({required String url});
}
