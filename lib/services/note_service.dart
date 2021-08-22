import 'package:flutter/material.dart';
import 'package:rest_api/models/notes_for_listing.dart';

class NoteService {
  List<NoteForListing> getNoteList() {
    return [
      // Note 1
      new NoteForListing(
          noteID: "1",
          noteTitle: "Note 1",
          createDateTime: DateTime.now(),
          lastEditDateTime: DateTime.now()),

      // Note 2
      new NoteForListing(
          noteID: "2",
          noteTitle: "Note 2",
          createDateTime: DateTime.now(),
          lastEditDateTime: DateTime.now()),

      // Note 3
      new NoteForListing(
          noteID: "3",
          noteTitle: "Note 3",
          createDateTime: DateTime.now(),
          lastEditDateTime: DateTime.now())
    ];
  }
}
