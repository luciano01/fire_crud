import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
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
  void initState() {
    reaction((_) => homeState.errorMessage, (hasError) {
      if (hasError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red.shade400,
            content: Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Expanded(child: Text(homeState.errorMessage!)),
              ],
            ),
            action: SnackBarAction(
              label: 'Try Again',
              textColor: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    });
    super.initState();
  }

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber.shade500,
        child: const Icon(Icons.add),
        onPressed: () {
          Modular.to.pushNamed("/registerNote");
        },
      ),
      body: Observer(builder: (_) {
        List<Note>? listOfNotes = homeState.listOfNotes?.value;

        if (listOfNotes == null || homeState.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (listOfNotes.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.emptyList,
                  width: 180,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    'Ooops...Empty list!',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Colors.grey.shade900,
                        ),
                  ),
                ),
                Text(
                  'Add a new Note by clicking the button below.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey.shade700,
                      ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: listOfNotes.length,
          itemBuilder: (context, index) {
            Note noteModel = listOfNotes[index];
            return Dismissible(
              key: Key(noteModel.uid!),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red.shade400,
                child: const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.delete_forever,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Delete Note?"),
                      content: const Text(
                        "This Note will be permanently deleted. Are sure about this?",
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text("Delete"),
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (DismissDirection direction) {
                homeState.deleteNote(noteModel: noteModel);
              },
              child: ListTile(
                leading: IconButton(
                  icon: noteModel.isCompleted!
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.yellow.shade800,
                        )
                      : Icon(
                          Icons.check_circle_outline,
                          color: Colors.yellow.shade800,
                        ),
                  onPressed: () {
                    homeState.updateNote(noteModelToUpdate: noteModel);
                  },
                ),
                trailing: Text(
                  DateFormat.yMMMd(
                    'en_US',
                  ).format(
                    noteModel.date!.toDate(),
                  ),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                        decoration: noteModel.isCompleted!
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                ),
                title: Text(
                  noteModel.title!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey.shade900,
                        decoration: noteModel.isCompleted!
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                ),
                subtitle: Text(
                  noteModel.description!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontStyle: FontStyle.normal,
                        color: Colors.grey.shade900,
                        decoration: noteModel.isCompleted!
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                ),
                onTap: () {
                  Modular.to.pushNamed(
                    "/registerNote/",
                    arguments: noteModel,
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
