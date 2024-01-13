import '../../domain.dart';

abstract class UpdateNoteUseCase {
  /// Update a NoteEntity.
  Future<void> updateNote({required NoteEntity noteEntity});
}

class UpdateNoteUseCaseImpl implements UpdateNoteUseCase {
  final UpdateNoteRepository _updateNoteRepository;

  UpdateNoteUseCaseImpl({required UpdateNoteRepository updateNoteRepository})
      : _updateNoteRepository = updateNoteRepository;

  @override
  Future<void> updateNote({required NoteEntity noteEntity}) async {
    await _updateNoteRepository.updateNote(noteEntity: noteEntity);
  }
}
