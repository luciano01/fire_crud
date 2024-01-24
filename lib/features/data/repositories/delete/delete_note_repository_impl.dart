import '../../../domain/domain.dart';
import '../../data.dart';

class DeleteNoteRepositoryImpl implements DeleteNoteRepository {
  final DeleteNoteDataSource _deleteNoteDataSource;

  DeleteNoteRepositoryImpl({required DeleteNoteDataSource deleteNoteDataSource})
      : _deleteNoteDataSource = deleteNoteDataSource;

  @override
  Future<void> deleteNote({required Note noteModel}) async {
    await _deleteNoteDataSource.deleteNote(noteModel: noteModel);
  }
}
