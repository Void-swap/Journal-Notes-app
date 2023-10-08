import "dart:math";

import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:jorunal_app/constants/colors.dart";
import "package:jorunal_app/models/note.dart";
import "package:jorunal_app/screens/edit_screen.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  bool sorted = false;
  List<Note> sortNotesByModifiedTime(List<Note> notes) {
    if (sorted) {
      notes.sort((a, b) => a.modifiedTime.compareTo(b.modifiedTime));
    } else {
      notes.sort((b, a) => a.modifiedTime.compareTo(b.modifiedTime));
    }

    sorted = !sorted;

    return notes;
  }

//used to store searched NOTE
  List<Note> filteredNotes = [];
  @override
  void initState() {
    super.initState();
    filteredNotes = sampleNotes;
  }

  void onSearchTextChanged(String searchText) {
    setState(() {
      filteredNotes = sampleNotes
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void deleteNote(int index) {
    setState(() {
      Note note = filteredNotes[index];
      sampleNotes.remove(index);
      filteredNotes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Journal",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    //
                    //
                    //filteredNotes=sortNotesByModifiedTime(filteredNotes);
                  },
                  padding: EdgeInsets.all(0),
                  icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.sort, color: Colors.white)),
                )
              ],
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: onSearchTextChanged,
              style: TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search ...",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                fillColor: Colors.grey.shade800,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 30),
                itemCount: filteredNotes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 20),
                    elevation: 3,
                    color: getRandomColor(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ListTile(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  EditScreen(note: filteredNotes[index]),
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              int originalIndex =
                                  sampleNotes.indexOf(filteredNotes[index]);

                              sampleNotes[originalIndex] = Note(
                                  id: sampleNotes[originalIndex].id,
                                  title: result[0],
                                  content: result[1],
                                  modifiedTime: DateTime.now());

                              filteredNotes[index] = Note(
                                  id: filteredNotes[index].id,
                                  title: result[0],
                                  content: result[1],
                                  modifiedTime: DateTime.now());
                            });
                          }
                        },
                        title: RichText(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text: "${filteredNotes[index].title}\n",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  height: 1.5),
                              children: [
                                TextSpan(
                                  text: filteredNotes[index].content,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      height: 1.5),
                                ),
                              ]),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Edited: ${DateFormat("EEE MMM d,yyyy h:mm a").format(filteredNotes[index].modifiedTime)}\n",
                            style: TextStyle(
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey.shade800),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            final result = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      backgroundColor: Colors.grey.shade900,
                                      icon:
                                          Icon(Icons.info, color: Colors.grey),
                                      title: Text(
                                        "Are you sure you want to delete?",
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context, true);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.green.shade400),
                                              child: SizedBox(
                                                width: 60,
                                                child: Text(
                                                  "Yes",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white70),
                                                ),
                                              )),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context, false);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.red.shade400),
                                              child: SizedBox(
                                                width: 60,
                                                child: Text(
                                                  "No",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white70),
                                                ),
                                              ))
                                        ],
                                      ));
                                });
                            if (result != null && result) deleteNote(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const EditScreen(),
            ),
          );

          if (result != null) {
            setState(() {
              sampleNotes.add(Note(
                  id: sampleNotes.length,
                  title: result[0],
                  content: result[1],
                  modifiedTime: DateTime.now()));
              filteredNotes = sampleNotes;
            });
          }
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: const Icon(
          Icons.add,
          size: 38,
        ),
      ),
    );
  }
}
