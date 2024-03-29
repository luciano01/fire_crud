import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../presentation.dart';

class RegisterNotePage extends StatelessWidget {
  RegisterNotePage({Key? key}) : super(key: key);

  final registerNoteState = Modular.get<RegisterNoteState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(registerNoteState.isUpdate ? 'Update Note' : 'Create Note'),
        actions: [
          Visibility(
            visible: registerNoteState.isUpdate,
            child: IconButton(
              icon: Icon(
                Icons.delete_forever_outlined,
                color: Colors.red.shade400,
              ),
              onPressed: () async {
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
                          onPressed: () {
                            registerNoteState.deleteNote();
                            Navigator.of(context).pop(true);
                          },
                          child: const Text("Delete"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              Size(MediaQuery.of(context).size.width, 48),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.amber.shade500;
                } else if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade400;
                }
                return Colors.amber.shade500;
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          onPressed: registerNoteState.isValid
              ? () => registerNoteState.saveNote()
              : null,
          child: Text(
            'Save',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color: Colors.grey.shade50,
                ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey.shade900,
                    ),
              ),
              Observer(builder: (_) {
                return TextFormField(
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.yellow.shade900,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey.shade900,
                      ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.yellow.shade800,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.yellow.shade900,
                      ),
                    ),
                    hintText: 'Add Note Title...',
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Colors.grey.shade700,
                        ),
                    errorText: registerNoteState.validateTitle(),
                  ),
                  onChanged: (value) =>
                      registerNoteState.noteModel.setTitle(value),
                  initialValue: registerNoteState.noteModel.title,
                );
              }),
              const SizedBox(height: 16),
              Text(
                'Description',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey.shade900,
                    ),
              ),
              Observer(builder: (_) {
                return TextFormField(
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.yellow.shade900,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey.shade900,
                      ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.yellow.shade800,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.yellow.shade900,
                      ),
                    ),
                    hintText: 'Add Note Description...',
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Colors.grey.shade700,
                        ),
                    errorText: registerNoteState.validateDescription(),
                  ),
                  onChanged: (value) =>
                      registerNoteState.noteModel.setDescription(value),
                  initialValue: registerNoteState.noteModel.description,
                );
              }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey.shade900,
                      ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Observer(builder: (_) {
                return OutlinedButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.yellow.shade900,
                  ),
                  label: Text(
                    DateFormat.yMd(
                      'en_US',
                    ).format(
                      registerNoteState.noteModel.date?.toDate() ??
                          DateTime.now(),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Colors.grey.shade600,
                        ),
                  ),
                  onPressed: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: registerNoteState.noteModel.date?.toDate() ??
                          DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                      builder: (context, child) {
                        return child!;
                      },
                    );
                    if (picked != null) {
                      registerNoteState.noteModel.setDate(
                        Timestamp.fromDate(picked),
                      );
                    }
                  },
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
