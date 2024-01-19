import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';
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

  test('Should delete a NoteModel from DeleteNoteRepository.', () async {
    final mockNoteModel = NoteModel.empty();

    when(() => mockDeleteNoteRepository.deleteNote(noteModel: mockNoteModel))
        .thenAnswer((_) async => Future.value());

    await deleteNoteUseCaseImpl.deleteNote(noteModel: mockNoteModel);

    verify(
      () => mockDeleteNoteRepository.deleteNote(noteModel: mockNoteModel),
    );
    verifyNoMoreInteractions(mockDeleteNoteRepository);
  });
}
