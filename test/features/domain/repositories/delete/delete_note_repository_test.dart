import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';
import 'package:fire_crud/features/domain/domain.dart';

class MockDeleteNoteRepository extends Mock implements DeleteNoteRepository {}

void main() {
  late MockDeleteNoteRepository mockDeleteNoteRepository;

  setUp(() {
    mockDeleteNoteRepository = MockDeleteNoteRepository();
  });

  test('Should delete a NoteModel.', () async {
    final mockNoteModel = Note();

    when(() => mockDeleteNoteRepository.deleteNote(noteModel: mockNoteModel))
        .thenAnswer((_) async => Future.value());

    await mockDeleteNoteRepository.deleteNote(noteModel: mockNoteModel);

    verify(
      () => mockDeleteNoteRepository.deleteNote(noteModel: mockNoteModel),
    );
    verifyNoMoreInteractions(mockDeleteNoteRepository);
  });
}
