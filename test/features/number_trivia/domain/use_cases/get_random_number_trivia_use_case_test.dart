import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia_tdd/core/logger/logger.dart';
import 'package:trivia_tdd/core/use_cases/use_case.dart';
import 'package:trivia_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:trivia_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:trivia_tdd/features/number_trivia/domain/use_cases/get_random_number_use_case.dart';

import 'get_number_trivia_use_case_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
main() {
  test('should get Random trivia for the number from the repository', () async {
    // arrange
    final mocaRepository = MockNumberTriviaRepository();
    final useCase = GetRandomNumberUseCase(mocaRepository);
    const int tNumber = 1;
    const tNumberTrivia = NumberTrivia(text: 'test', number: tNumber);

    when(mocaRepository.getRandomNumberTrivia())
        .thenAnswer((_) async => const Right(tNumberTrivia));

    expect(await useCase(NoParams()), const Right(tNumberTrivia));

    // assert
    verify(mocaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mocaRepository);
  });
}
