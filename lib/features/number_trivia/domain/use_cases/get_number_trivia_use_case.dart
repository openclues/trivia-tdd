import 'package:dartz/dartz.dart';
import 'package:trivia_tdd/core/error/failure.dart';
import 'package:trivia_tdd/features/number_trivia/domain/entities/number_trivia.dart';

import '../repositories/number_trivia_repository.dart';

class GetNumberTriviaUseCase {
  final NumberTriviaRepository _repository;

  GetNumberTriviaUseCase(this._repository);

  Future<Either<Failure, NumberTrivia>> execute({required int number}) async {
    return await _repository.getConcreteNumberTrivia(number);
  }
}
