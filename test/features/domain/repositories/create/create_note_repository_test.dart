import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/domain/domain.dart';

class MockCreateNoteRepository extends Mock implements CreateNoteRepository {}

void main() {
  late MockCreateNoteRepository mockCreateNoteRepository;

  setUp(() {
    mockCreateNoteRepository = MockCreateNoteRepository();
  });

  test('Should create a NoteEntity.', () async {
    final mockNoteEntity = NoteEntity();

    when(() => mockCreateNoteRepository.createNote(noteEntity: mockNoteEntity))
        .thenAnswer((_) async => Future.value);

    await mockCreateNoteRepository.createNote(
      noteEntity: mockNoteEntity,
    );

    verify(
      () => mockCreateNoteRepository.createNote(noteEntity: mockNoteEntity),
    );
    verifyNoMoreInteractions(mockCreateNoteRepository);
  });
}
