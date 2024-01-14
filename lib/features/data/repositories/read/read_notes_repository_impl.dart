import '../../data.dart';

import '../../../domain/domain.dart';

class ReadNotesRepositoryImpl implements ReadNotesRepository {
  final ReadNotesDataSource _readNotesDataSource;

  ReadNotesRepositoryImpl({required ReadNotesDataSource readNotesDataSource})
      : _readNotesDataSource = readNotesDataSource;

  @override
  Stream<List<NoteModel>> readNotes() {
    return _readNotesDataSource.readNotes();
  }
}
