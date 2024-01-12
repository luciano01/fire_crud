import '../../domain.dart';

abstract class DeleteNoteUseCase {
  /// Delete a NoteEntity.
  Future<void> deleteNote({required NoteEntity noteEntity});
}

class DeleteNoteUseCaseImpl implements DeleteNoteUseCase {
  final DeleteNoteRepository _deleteNoteRepository;

  DeleteNoteUseCaseImpl({required DeleteNoteRepository deleteNoteRepository})
      : _deleteNoteRepository = deleteNoteRepository;

  @override
  Future<void> deleteNote({required NoteEntity noteEntity}) async {
    await _deleteNoteRepository.deleteNote(noteEntity: noteEntity);
  }
}
