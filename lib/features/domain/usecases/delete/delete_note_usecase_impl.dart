import '../../../data/data.dart';
import '../../domain.dart';

abstract class DeleteNoteUseCase {
  /// Delete a NoteEntity.
  Future<void> deleteNote({required Note noteModel});
}

class DeleteNoteUseCaseImpl implements DeleteNoteUseCase {
  final DeleteNoteRepository _deleteNoteRepository;

  DeleteNoteUseCaseImpl({required DeleteNoteRepository deleteNoteRepository})
      : _deleteNoteRepository = deleteNoteRepository;

  @override
  Future<void> deleteNote({required Note noteModel}) async {
    await _deleteNoteRepository.deleteNote(noteModel: noteModel);
  }
}
