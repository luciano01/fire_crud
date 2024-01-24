import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';

class MockUpdateNoteDataSource extends Mock implements UpdateNoteDataSource {}

void main() {
  late MockUpdateNoteDataSource mockUpdateNoteDataSource;

  setUp(() {
    mockUpdateNoteDataSource = MockUpdateNoteDataSource();
  });

  test('Should delete a NoteModel from FirebaseFirestore.', () async {
    final mockNoteModel = Note();

    when(() => mockUpdateNoteDataSource.updateNote(noteModel: mockNoteModel))
        .thenAnswer((_) async => Future.value());

    await mockUpdateNoteDataSource.updateNote(noteModel: mockNoteModel);

    verify(() => mockUpdateNoteDataSource.updateNote(noteModel: mockNoteModel));
    verifyNoMoreInteractions(mockUpdateNoteDataSource);
  });
}
