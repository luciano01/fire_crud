import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/domain/domain.dart';

class MockReadNotesRepository extends Mock implements ReadNotesRepository {}

void main() {
  late MockReadNotesRepository mockReadNotesRepository;
  late ReadNotesUseCaseImp readNotesUseCaseImp;

  setUp(() {
    mockReadNotesRepository = MockReadNotesRepository();
    readNotesUseCaseImp = ReadNotesUseCaseImp(
      readNotesRepository: mockReadNotesRepository,
    );
  });

  test('Should a List of NotesEntity from Repository.', () async {
    final mockListOfNotes = [
      NoteEntity(),
    ];

    when(() => mockReadNotesRepository.readNotes())
        .thenAnswer((_) => Stream.fromIterable([mockListOfNotes]));

    final result = readNotesUseCaseImp.readNotes();

    expect(result, isA<Stream<List<NoteEntity>>>());
  });
}
