import '../../domain.dart';

abstract class CreateNoteUseCase {
  /// Create a NoteEntity.
  Future<void> createNote({required NoteEntity noteEntity});
}

class CreateNoteUseCaseImpl implements CreateNoteUseCase {
  final CreateNoteRepository _createNoteRepository;

  CreateNoteUseCaseImpl({required CreateNoteRepository createNoteRepository})
      : _createNoteRepository = createNoteRepository;

  @override
  Future<void> createNote({required NoteEntity noteEntity}) async {
    await _createNoteRepository.createNote(noteEntity: noteEntity);
  }
}
