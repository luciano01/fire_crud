import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';

class MockUpdateNoteDataSource extends Mock implements UpdateNoteDataSource {}

void main() {
  late MockUpdateNoteDataSource mockUpdateNoteDataSource;
  late UpdateNoteRepositoryImpl updateNoteRepositoryImpl;

  setUp(() {
    mockUpdateNoteDataSource = MockUpdateNoteDataSource();
    updateNoteRepositoryImpl = UpdateNoteRepositoryImpl(
      updateNoteDataSource: mockUpdateNoteDataSource,
    );
  });

  test('Should update a NoteModel from UpdateNoteDataSource.', () async {
    final mockNoteModel = NoteModel();

    when(() => mockUpdateNoteDataSource.updateNote(noteModel: mockNoteModel))
        .thenAnswer((_) async => Future.value());

    await updateNoteRepositoryImpl.updateNote(noteModel: mockNoteModel);

    verify(() => mockUpdateNoteDataSource.updateNote(noteModel: mockNoteModel));
    verifyNoMoreInteractions(mockUpdateNoteDataSource);
  });
}
