import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/core.dart';
import '../../data.dart';

class ReadNotesDataSourceImpl implements ReadNotesDataSource {
  final FirebaseFirestore _firebaseFirestore;

  ReadNotesDataSourceImpl({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  @override
  Stream<List<NoteModel>> readNotes() {
    try {
      return _firebaseFirestore.collection("notes").snapshots().map(
          (snapshot) => snapshot.docs
              .map((document) => NoteModel.fromJson(document))
              .toList());
    } catch (e) {
      throw ServerException(errorMessage: "Error to read all NotesModel.");
    }
  }
}
