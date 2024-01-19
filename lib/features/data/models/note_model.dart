import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String? uid;
  String name;
  bool isCompleted;
  Timestamp date;

  NoteModel({
    this.uid,
    required this.name,
    required this.isCompleted,
    required this.date,
  });

  factory NoteModel.empty() {
    return NoteModel(
      name: '',
      isCompleted: false,
      date: Timestamp.now(),
    );
  }

  factory NoteModel.fromJson(DocumentSnapshot snapshot) {
    return NoteModel(
      uid: snapshot.id,
      name: snapshot.get('name') ?? "",
      isCompleted: snapshot.get('isCompleted') ?? false,
      date: snapshot.get('date') ?? Timestamp.fromDate(DateTime.now()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isCompleted': isCompleted,
      'date': date,
    };
  }

  NoteModel copyWith({
    String? uid,
    String? name,
    bool? isCompleted,
    Timestamp? date,
  }) =>
      NoteModel(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        isCompleted: isCompleted ?? this.isCompleted,
        date: date ?? this.date,
      );
}
