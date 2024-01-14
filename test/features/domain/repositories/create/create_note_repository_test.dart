import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';
import 'package:fire_crud/features/domain/domain.dart';

class MockCreateNoteRepository extends Mock implements CreateNoteRepository {}

void main() {
  late MockCreateNoteRepository mockCreateNoteRepository;

  setUp(() {
    mockCreateNoteRepository = MockCreateNoteRepository();
  });

  test('Should create a NoteModel.', () async {
    final mockNoteModel = NoteModel();

    when(() => mockCreateNoteRepository.createNote(noteModel: mockNoteModel))
        .thenAnswer((_) async => Future.value);

    await mockCreateNoteRepository.createNote(
      noteModel: mockNoteModel,
    );

    verify(
      () => mockCreateNoteRepository.createNote(noteModel: mockNoteModel),
    );
    verifyNoMoreInteractions(mockCreateNoteRepository);
  });
}
