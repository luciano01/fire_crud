import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/domain/domain.dart';

class MockReadNotesRepository extends Mock implements ReadNotesRepository {}

void main() {
  late MockReadNotesRepository mockReadNotesRepository;

  setUp(() {
    mockReadNotesRepository = MockReadNotesRepository();
  });

  test('Should return a List of NoteEntity.', () async {
    final mockListOfNotes = [
      NoteEntity(),
    ];

    when(() => mockReadNotesRepository.readNotes())
        .thenAnswer((_) => Stream.fromIterable([mockListOfNotes]));

    final result = mockReadNotesRepository.readNotes();

    expect(result, isA<Stream<List<NoteEntity>>>());
  });
}
