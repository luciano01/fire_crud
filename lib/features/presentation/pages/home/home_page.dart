import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../data/data.dart';
import '../../presentation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeState = Modular.get<HomeState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Observer(builder: (_) {
        List<NoteModel>? listOfNotes = homeState.listOfNotes!.value;

        if (listOfNotes == null) {
          return const Center(child: Text("Null"));
        }

        if (listOfNotes.isEmpty) {
          return const Center(child: Text("Empty"));
        }

        return ListView.builder(
          itemCount: listOfNotes.length,
          itemBuilder: (context, index) {
            NoteModel noteModel = listOfNotes[index];
            return ListTile(
              title: Text(noteModel.name ?? "No Name"),
              subtitle: Text(noteModel.date?.toDate().toString() ?? "No Date"),
              trailing: Text(noteModel.isCompleted.toString()),
            );
          },
        );
      }),
    );
  }
}
