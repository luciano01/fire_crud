import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';
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

  test('Should update a NoteModel from UpdateNoteRepository.', () async {
    final mockNoteModel = NoteModel.empty();

    when(() => mockUpdateNoteRepository.updateNote(noteModel: mockNoteModel))
        .thenAnswer((_) async => Future.value());

    await updateNoteUseCaseImpl.updateNote(noteModel: mockNoteModel);

    verify(
      () => mockUpdateNoteRepository.updateNote(noteModel: mockNoteModel),
    );
    verifyNoMoreInteractions(mockUpdateNoteRepository);
  });
}
