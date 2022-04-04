import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/useCase/use_case.dart';
import '../entity/url.dart';
import '../repository/url_repository.dart';

class GetExtractUrl implements UseCase<URL, Params> {
  final UrlRepository repository;

  GetExtractUrl({required this.repository});

  @override
  Future<Either<Failure, URL>> call(Params params) async =>
      repository.getExtractUrl(url: params.url);
}

class Params extends Equatable {
  final String url;

  const Params({required this.url});

  @override
  List<Object?> get props => [url];
}
