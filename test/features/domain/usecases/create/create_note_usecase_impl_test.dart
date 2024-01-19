import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';
import 'package:fire_crud/features/domain/domain.dart';

class MockCreateNoteRepository extends Mock implements CreateNoteRepository {}

void main() {
  late MockCreateNoteRepository mockCreateNoteRepository;
  late CreateNoteUseCaseImpl createNoteUseCaseImpl;

  setUp(() {
    mockCreateNoteRepository = MockCreateNoteRepository();
    createNoteUseCaseImpl = CreateNoteUseCaseImpl(
      createNoteRepository: mockCreateNoteRepository,
    );
  });

  test('Should create a NoteModel from the CreateNoteRepository.', () async {
    final mockNoteModel = NoteModel.empty();

    when(() => mockCreateNoteRepository.createNote(noteModel: mockNoteModel))
        .thenAnswer((_) async => Future.value);

    await createNoteUseCaseImpl.createNote(noteModel: mockNoteModel);

    verify(() => mockCreateNoteRepository.createNote(noteModel: mockNoteModel));
    verifyNoMoreInteractions(mockCreateNoteRepository);
  });
}
