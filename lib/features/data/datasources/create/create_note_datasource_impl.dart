import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/core.dart';
import '../../data.dart';

class CreateNoteDataSourceImpl implements CreateNoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  CreateNoteDataSourceImpl({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  @override
  Future<DocumentReference> createNote({
    required NoteModel noteModel,
  }) async {
    if (noteModel.uid == null) {
      return _firebaseFirestore.collection("notes").add(noteModel.toJson());
    } else {
      throw ServerException(errorMessage: "Error to Add a NoteModel.");
    }
  }
}
