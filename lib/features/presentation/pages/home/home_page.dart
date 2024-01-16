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
        leading: Icon(
          Icons.account_circle,
          color: Colors.grey.shade900,
        ),
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            text: 'Hello, ',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
            children: [
              TextSpan(
                text: 'Luciano',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey.shade900,
                    ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey.shade900,
            ),
            onPressed: () {},
          ),
        ],
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
              leading: IconButton(
                icon: noteModel.isCompleted ?? false
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.yellow.shade800,
                      )
                    : Icon(
                        Icons.check_circle_outline,
                        color: Colors.yellow.shade800,
                      ),
                onPressed: () {},
              ),
              trailing: Text(
                noteModel.date!.toDate().toString(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey.shade700,
                      decoration: noteModel.isCompleted ?? false
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
              ),
              title: Text(
                noteModel.name ?? "",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey.shade900,
                      decoration: noteModel.isCompleted ?? false
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
              ),
              onTap: () {},
            );
          },
        );
      }),
    );
  }
}
