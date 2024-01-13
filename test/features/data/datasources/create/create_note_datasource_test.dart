// ignore_for_file: subtype_of_sealed_class

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fire_crud/features/data/data.dart';

class MockCreateNoteDataSource extends Mock implements CreateNoteDataSource {}

class MockDocumentReference extends Mock implements DocumentReference {}

void main() {
  late MockCreateNoteDataSource mockCreateNoteDataSource;
  late MockDocumentReference mockDocumentReference;

  setUp(() {
    mockCreateNoteDataSource = MockCreateNoteDataSource();
    mockDocumentReference = MockDocumentReference();
  });

  test('Should return a DocumentReference.', () async {
    final mockNoteModel = NoteModel();

    when(() => mockCreateNoteDataSource.createNote(noteModel: mockNoteModel))
        .thenAnswer((_) async => mockDocumentReference);

    await mockCreateNoteDataSource.createNote(noteModel: mockNoteModel);

    verify(() => mockCreateNoteDataSource.createNote(noteModel: mockNoteModel));
    verifyNoMoreInteractions(mockCreateNoteDataSource);
    verifyNoMoreInteractions(mockDocumentReference);
  });
}
