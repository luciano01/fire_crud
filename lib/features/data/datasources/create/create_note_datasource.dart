import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data.dart';

abstract class CreateNoteDataSource {
  /// Create a NoteModel and returna a DocumentReference from Firebase Firestore.
  Future<DocumentReference> createNote({required NoteModel noteModel});
}
