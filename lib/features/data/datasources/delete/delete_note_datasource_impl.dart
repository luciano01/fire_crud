import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_crud/core/core.dart';

import '../../data.dart';

class DeleteNoteDataSourceImpl implements DeleteNoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  DeleteNoteDataSourceImpl({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  @override
  Future<void> deleteNote({required NoteModel noteModel}) async {
    final noteModelUid =
        _firebaseFirestore.collection("notes").doc(noteModel.uid).id;

    if (noteModel.uid != null && noteModelUid.isNotEmpty) {
      await _firebaseFirestore.collection("notes").doc(noteModel.uid).delete();
    } else {
      throw ServerException(errorMessage: "Error to delete a NoteModel.");
    }
  }
}
