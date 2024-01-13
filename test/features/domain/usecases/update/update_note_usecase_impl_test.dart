import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/domain/domain.dart';

class MockUpdateNoteRepository extends Mock implements UpdateNoteRepository {}

void main() {
  late MockUpdateNoteRepository mockUpdateNoteRepository;
  late UpdateNoteUseCaseImpl updateNoteUseCaseImpl;

  setUp(() {
    mockUpdateNoteRepository = MockUpdateNoteRepository();
    updateNoteUseCaseImpl = UpdateNoteUseCaseImpl(
      updateNoteRepository: mockUpdateNoteRepository,
    );
  });

  test('Should update a NoteEntity from UpdateNoteRepository.', () async {
    final mockNoteEntity = NoteEntity();

    when(() => mockUpdateNoteRepository.updateNote(noteEntity: mockNoteEntity))
        .thenAnswer((_) async => Future.value());

    await updateNoteUseCaseImpl.updateNote(noteEntity: mockNoteEntity);

    verify(
      () => mockUpdateNoteRepository.updateNote(noteEntity: mockNoteEntity),
    );
    verifyNoMoreInteractions(mockUpdateNoteRepository);
  });
}
