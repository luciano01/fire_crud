import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/domain/domain.dart';

class MockUpdateNoteRepository extends Mock implements UpdateNoteRepository {}

void main() {
  late MockUpdateNoteRepository mockUpdateNoteRepository;

  setUp(() {
    mockUpdateNoteRepository = MockUpdateNoteRepository();
  });

  test('Should update a NoteEntity.', () async {
    final mockNoteEntity = NoteEntity();

    when(() => mockUpdateNoteRepository.updateNote(noteEntity: mockNoteEntity))
        .thenAnswer((_) async => Future.value());

    await mockUpdateNoteRepository.updateNote(noteEntity: mockNoteEntity);

    verify(
        () => mockUpdateNoteRepository.updateNote(noteEntity: mockNoteEntity));
    verifyNoMoreInteractions(mockUpdateNoteRepository);
  });
}
