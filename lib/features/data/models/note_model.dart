import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String? uid;
  String title;
  String description;
  bool isCompleted;
  Timestamp date;

  NoteModel({
    this.uid,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.date,
  });

  factory NoteModel.empty() {
    return NoteModel(
      title: '',
      description: '',
      isCompleted: false,
      date: Timestamp.now(),
    );
  }

  factory NoteModel.fromJson(DocumentSnapshot snapshot) {
    return NoteModel(
      uid: snapshot.id,
      title: snapshot.get('title') ?? "",
      description: snapshot.get('description') ?? "",
      isCompleted: snapshot.get('isCompleted') ?? false,
      date: snapshot.get('date') ?? Timestamp.fromDate(DateTime.now()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'date': date,
    };
  }

  NoteModel copyWith({
    String? uid,
    String? title,
    String? description,
    bool? isCompleted,
    Timestamp? date,
  }) =>
      NoteModel(
        uid: uid ?? this.uid,
        title: title ?? this.title,
        description: description ?? this.description,
        isCompleted: isCompleted ?? this.isCompleted,
        date: date ?? this.date,
      );
}
