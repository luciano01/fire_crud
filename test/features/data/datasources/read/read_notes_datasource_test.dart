import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';

class MockReadNotesDataSource extends Mock implements ReadNotesDataSource {}

void main() {
  late MockReadNotesDataSource mockReadNotesDataSource;

  setUp(() {
    mockReadNotesDataSource = MockReadNotesDataSource();
  });

  test('Should return a List of NoteModel from FirebaseFirestore.', () async {
    final mockListOfNotes = [
      NoteModel.empty(),
    ];

    when(() => mockReadNotesDataSource.readNotes())
        .thenAnswer((_) => Stream.fromIterable([mockListOfNotes]));

    final result = mockReadNotesDataSource.readNotes();

    expect(result, isA<Stream<List<NoteModel>>>());
  });
}
