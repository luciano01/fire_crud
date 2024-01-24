import '../../../domain/domain.dart';
import '../../data.dart';

class UpdateNoteRepositoryImpl implements UpdateNoteRepository {
  final UpdateNoteDataSource _updateNoteDataSource;

  UpdateNoteRepositoryImpl({required UpdateNoteDataSource updateNoteDataSource})
      : _updateNoteDataSource = updateNoteDataSource;

  @override
  Future<void> updateNote({required Note noteModel}) async {
    await _updateNoteDataSource.updateNote(noteModel: noteModel);
  }
}
