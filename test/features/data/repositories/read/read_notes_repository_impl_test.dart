import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';

class MockReadNotesDataSource extends Mock implements ReadNotesDataSource {}

void main() {
  late MockReadNotesDataSource mockReadNotesDataSource;
  late ReadNotesRepositoryImpl readNotesRepositoryImpl;

  setUp(() {
    mockReadNotesDataSource = MockReadNotesDataSource();
    readNotesRepositoryImpl = ReadNotesRepositoryImpl(
      readNotesDataSource: mockReadNotesDataSource,
    );
  });

  test('Should return a List of NoteModel from ReadNotesDataSource.', () async {
    final mockListOfNotesModel = [
      Note(),
    ];

    when(() => mockReadNotesDataSource.readNotes())
        .thenAnswer((_) => Stream.fromIterable([mockListOfNotesModel]));

    final result = readNotesRepositoryImpl.readNotes();

    expect(result, isA<Stream<List<Note>>>());
    verify(() => mockReadNotesDataSource.readNotes());
    verifyNoMoreInteractions(mockReadNotesDataSource);
  });
}
