import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void viewSavedWordPair(
    BuildContext context, Iterable<WordPair> _savedWordPairs) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
      return ListTile(
        tileColor: Colors.grey.shade100,
        title: Text(pair.asPascalCase,
            style: const TextStyle(
              fontSize: 16,
            )),
      );
    });

    final List<Widget> divided =
        ListTile.divideTiles(context: context, tiles: tiles).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Saved Wordpairs"),
      ),
      body: ListView(
        children: divided,
      ),
    );
  }));
}
