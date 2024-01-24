import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';

class MockDeleteTaskDataSource extends Mock implements DeleteNoteDataSource {}

void main() {
  late MockDeleteTaskDataSource mockDeleteTaskDataSource;

  setUp(() {
    mockDeleteTaskDataSource = MockDeleteTaskDataSource();
  });

  test('Should delete a NoteModel.', () async {
    final mockNoteModel = Note();

    when(() => mockDeleteTaskDataSource.deleteNote(noteModel: mockNoteModel))
        .thenAnswer((_) async => Future.value());

    await mockDeleteTaskDataSource.deleteNote(noteModel: mockNoteModel);

    verify(() => mockDeleteTaskDataSource.deleteNote(noteModel: mockNoteModel));
    verifyNoMoreInteractions(mockDeleteTaskDataSource);
  });
}
