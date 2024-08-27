import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trivia_tdd/core/error/failure.dart';
import 'package:trivia_tdd/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../core/use_cases/use_case.dart';
import '../repositories/number_trivia_repository.dart';

class GetNumberTriviaUseCase implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository _repository;

  GetNumberTriviaUseCase(this._repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return _repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object> get props => [number];
}
