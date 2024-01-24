import '../../data.dart';

import '../../../domain/domain.dart';

class ReadNotesRepositoryImpl implements ReadNotesRepository {
  final ReadNotesDataSource _readNotesDataSource;

  ReadNotesRepositoryImpl({required ReadNotesDataSource readNotesDataSource})
      : _readNotesDataSource = readNotesDataSource;

  @override
  Stream<List<Note>> readNotes() {
    return _readNotesDataSource.readNotes();
  }
}
