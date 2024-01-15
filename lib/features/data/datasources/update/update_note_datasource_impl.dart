import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_crud/core/core.dart';

import '../../data.dart';

class UpdateNoteDataSourceImpl implements UpdateNoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  UpdateNoteDataSourceImpl({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  @override
  Future<void> updateNote({required NoteModel noteModel}) async {
    final noteUid =
        _firebaseFirestore.collection("notes").doc(noteModel.uid).id;

    if (noteModel.uid != null && noteUid.isNotEmpty) {
      await _firebaseFirestore
          .collection("notes")
          .doc(noteModel.uid)
          .update(noteModel.toJson());
    } else {
      throw ServerException(errorMessage: "Error to update a NoteModel.");
    }
  }
}
