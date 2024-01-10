import 'package:flutter_test/flutter_test.dart';

import 'package:fire_crud/features/domain/domain.dart';

void main() {
  final noteEntity = NoteEntity(
    uid: "abc-bca-cba",
    name: "Go to gym.",
    isCompleted: true,
    date: DateTime.now(),
  );

  test('The field [uid] must be of type String.', () async {
    expect(noteEntity.uid, isA<String>());
  });

  test('The field [name] must be of type String.', () async {
    expect(noteEntity.name, isA<String>());
  });

  test('The field [isCompleted] must be of type bool.', () async {
    expect(noteEntity.isCompleted, isA<bool>());
  });

  test('The field [date] must be of type DateTime.', () async {
    expect(noteEntity.date, isA<DateTime>());
  });
}
