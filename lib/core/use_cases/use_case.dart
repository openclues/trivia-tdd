import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trivia_tdd/core/error/failure.dart';

// The UseCase class is an abstract class that takes two type parameters: Type and Params.

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/*
  The NoParams class is a simple class that extends the Equatable class. 
  This class is used as a parameter for use cases that do not require any parameters. 
*/

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
