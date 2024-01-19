import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';

class MockDeleteNoteDataSource extends Mock implements DeleteNoteDataSource {}

void main() {
  late MockDeleteNoteDataSource mockDeleteNoteDataSource;
  late DeleteNoteRepositoryImpl deleteNoteRepositoryImpl;

  setUp(() {
    mockDeleteNoteDataSource = MockDeleteNoteDataSource();
    deleteNoteRepositoryImpl = DeleteNoteRepositoryImpl(
      deleteNoteDataSource: mockDeleteNoteDataSource,
    );
  });

  test('Shoudl delete a NoteModel from DeleteNoteDataSource.', () async {
    final mockNoteModel = NoteModel.empty();

    when(() => mockDeleteNoteDataSource.deleteNote(noteModel: mockNoteModel))
        .thenAnswer((_) async => Future.value());

    await deleteNoteRepositoryImpl.deleteNote(noteModel: mockNoteModel);

    verify(() => mockDeleteNoteDataSource.deleteNote(noteModel: mockNoteModel));
    verifyNoMoreInteractions(mockDeleteNoteDataSource);
  });
}
