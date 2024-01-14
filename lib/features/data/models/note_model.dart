import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String? uid;
  final String? name;
  final bool? isCompleted;
  final DateTime? date;

  NoteModel({
    this.uid,
    this.name,
    this.isCompleted,
    this.date,
  });

  factory NoteModel.fromJson(DocumentSnapshot snapshot) {
    return NoteModel(
      uid: snapshot.id,
      name: snapshot.get('name') ?? "",
      isCompleted: snapshot.get('isCompleted') ?? false,
      date: snapshot.get('date') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name ?? "",
      'isCompleted': isCompleted ?? false,
      'date': date ?? DateTime.now(),
    };
  }

  NoteModel copyWith({
    String? uid,
    String? name,
    bool? isCompleted,
    DateTime? date,
  }) =>
      NoteModel(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        isCompleted: isCompleted ?? this.isCompleted,
        date: date ?? this.date,
      );
}
