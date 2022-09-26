import 'package:advanced_flutter_arabic/data/network/failure.dart';
import 'package:advanced_flutter_arabic/domain/model/models.dart';
import 'package:advanced_flutter_arabic/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';

class HomeStoreUseCase implements BaseUseCase<void, HomeStoreNotNull> {
  final Repository _repository;

  HomeStoreUseCase(this._repository);

  @override
  Future<Either<Failure, HomeStoreNotNull>> execute(void input) async {
    return await _repository.getHomeStoreDetails();
  }
}
