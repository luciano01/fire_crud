import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/domain/domain.dart';

class MockDeleteNoteRepository extends Mock implements DeleteNoteRepository {}

void main() {
  late MockDeleteNoteRepository mockDeleteNoteRepository;

  setUp(() {
    mockDeleteNoteRepository = MockDeleteNoteRepository();
  });

  test('Should delete a NoteEntity.', () async {
    final mockNoteEntity = NoteEntity();

    when(() => mockDeleteNoteRepository.deleteNote(noteEntity: mockNoteEntity))
        .thenAnswer((invocation) async => Future.value());

    await mockDeleteNoteRepository.deleteNote(noteEntity: mockNoteEntity);

    verify(
      () => mockDeleteNoteRepository.deleteNote(noteEntity: mockNoteEntity),
    );
    verifyNoMoreInteractions(mockDeleteNoteRepository);
  });
}
