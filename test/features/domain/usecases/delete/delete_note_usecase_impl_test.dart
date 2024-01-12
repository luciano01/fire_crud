import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/domain/domain.dart';

class MockDeleteNoteRepository extends Mock implements DeleteNoteRepository {}

void main() {
  late MockDeleteNoteRepository mockDeleteNoteRepository;
  late DeleteNoteUseCaseImpl deleteNoteUseCaseImpl;

  setUp(() {
    mockDeleteNoteRepository = MockDeleteNoteRepository();
    deleteNoteUseCaseImpl = DeleteNoteUseCaseImpl(
      deleteNoteRepository: mockDeleteNoteRepository,
    );
  });

  test('Should delete a Note from DeleteNoteRepository.', () async {
    final mockNoteEntity = NoteEntity();

    when(() => mockDeleteNoteRepository.deleteNote(noteEntity: mockNoteEntity))
        .thenAnswer((_) async => Future.value());

    await deleteNoteUseCaseImpl.deleteNote(noteEntity: mockNoteEntity);

    verify(
      () => mockDeleteNoteRepository.deleteNote(noteEntity: mockNoteEntity),
    );
    verifyNoMoreInteractions(mockDeleteNoteRepository);
  });
}
