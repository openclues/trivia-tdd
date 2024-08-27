import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:trivia_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:trivia_tdd/features/number_trivia/domain/use_cases/get_number_trivia_use_case.dart';

import 'get_number_trivia_use_case_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
void main() {
  final mockNumberTriviaRepository = MockNumberTriviaRepository();
  final useCase = GetNumberTriviaUseCase(mockNumberTriviaRepository);

  const int tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: 'test', number: tNumber);

  test('should get trivia for the number from the repository', () async {
    // arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => const Right(tNumberTrivia));
    // act
    final result = await useCase(const Params(number: tNumber));
    // assert
    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
