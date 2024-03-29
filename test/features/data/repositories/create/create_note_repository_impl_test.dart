import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';

class MockCreateNoteDataSource extends Mock implements CreateNoteDataSource {}

void main() {
  late MockCreateNoteDataSource mockCreateNoteDataSource;
  late CreateNoteRepositoryImpl createNoteRepositoryImpl;

  setUp(() {
    mockCreateNoteDataSource = MockCreateNoteDataSource();
    createNoteRepositoryImpl = CreateNoteRepositoryImpl(
      createNoteDataSource: mockCreateNoteDataSource,
    );
  });

  test('Should create a NoteEntity from CreateNoteDataSource.', () async {
    final mockNoteModel = Note();

    when(() => mockCreateNoteDataSource.createNote(noteModel: mockNoteModel))
        .thenAnswer((_) async => Future.value());

    await createNoteRepositoryImpl.createNote(noteModel: mockNoteModel);

    verify(() => mockCreateNoteDataSource.createNote(noteModel: mockNoteModel));
    verifyNoMoreInteractions(mockCreateNoteDataSource);
  });
}
