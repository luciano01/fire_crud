import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';
import 'package:fire_crud/features/domain/domain.dart';

class MockUpdateNoteRepository extends Mock implements UpdateNoteRepository {}

void main() {
  late MockUpdateNoteRepository mockUpdateNoteRepository;

  setUp(() {
    mockUpdateNoteRepository = MockUpdateNoteRepository();
  });

  test('Should update a NoteModel.', () async {
    final mockNoteModel = Note();

    when(() => mockUpdateNoteRepository.updateNote(noteModel: mockNoteModel))
        .thenAnswer((_) async => Future.value());

    await mockUpdateNoteRepository.updateNote(noteModel: mockNoteModel);

    verify(() => mockUpdateNoteRepository.updateNote(noteModel: mockNoteModel));
    verifyNoMoreInteractions(mockUpdateNoteRepository);
  });
}
