import 'package:flutter/material.dart';
import '../models/note_model.dart';
import 'add_note_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [];

  void addNote(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes App'),
      ),
      body: notes.isEmpty
          ? Center(child: Text('No Notes Available'))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(notes[index].title),
                    subtitle: Text(notes[index].description),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteNote(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(),
            ),
          );
          if (result != null) addNote(result);
        },
      ),
    );
  }
}
