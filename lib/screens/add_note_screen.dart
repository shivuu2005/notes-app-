import 'package:flutter/material.dart';
import '../models/note_model.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void saveNote() {
    if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
      final newNote = Note(
        title: titleController.text,
        description: descriptionController.text,
      );
      Navigator.pop(context, newNote);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 5,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: saveNote,
              child: Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}
