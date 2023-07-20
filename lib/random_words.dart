import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPair>[];
  final _savedWordPairs = Set<WordPair>(); //Set cannot contain duplicates

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, item) {
          if (item.isOdd) return const Divider();

          final index = item ~/ 2;

          if (index >= _randomWordPairs.length) {
            _randomWordPairs.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_randomWordPairs[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedWordPairs.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: const TextStyle(fontSize: 18),
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.black : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _savedWordPairs.remove(pair);
          } else {
            _savedWordPairs.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
        return ListTile(
            tileColor: Colors.grey.shade100,
            title: Text(pair.asPascalCase,
                style: const TextStyle(
                  fontSize: 16,
                )));
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

  void _addWordPair() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Add WordPair"),
        ),
        body: const Form(child: TextField()),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WordPair Generator"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addWordPair,
        backgroundColor: Colors.grey.shade600,
        child: const Icon(Icons.add),
      ),
    );
  }
}
