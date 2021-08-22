import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api/models/notes_for_listing.dart';
import 'package:rest_api/services/note_service.dart';
import 'package:rest_api/views/note_delete.dart';
import 'package:rest_api/views/note_edit.dart';
import 'package:rest_api/views/note_modify.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NoteService get service => GetIt.I<NoteService>();
  List<NoteForListing> notes = [];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    notes = service.getNoteList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
          itemBuilder: (_, index) {
            return Dismissible(
              key: ValueKey(notes[index].noteID),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                final result = await showDialog(
                    context: context, builder: (__) => NoteDelete());
                print(result);
                return result;
              },
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              child: ListTile(
                title: Text(
                  notes[index].noteTitle,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text(
                    'last edited on ${formatDateTime(notes[index].lastEditDateTime)}'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => NoteEdit()));
                },
              ),
            );
          },
          separatorBuilder: (_, __) => Divider(
                height: 1,
                color: Colors.green,
              ),
          itemCount: notes.length),
    );
  }
}
