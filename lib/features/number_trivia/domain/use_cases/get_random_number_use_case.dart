import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trivia_tdd/core/error/failure.dart';
import 'package:trivia_tdd/core/use_cases/use_case.dart';
import 'package:trivia_tdd/features/number_trivia/domain/entities/number_trivia.dart';

import '../repositories/number_trivia_repository.dart';

class GetRandomNumberUseCase implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository _repository;

  GetRandomNumberUseCase(this._repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams noParams) async {
    return await _repository.getRandomNumberTrivia();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
