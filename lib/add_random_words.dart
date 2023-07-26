import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void addWordPair(BuildContext context, Function(WordPair) updateWordPairs) {
  TextEditingController firstWordController = TextEditingController();
  TextEditingController secondWordController = TextEditingController();

  void handleFormSubmission() {
    String firstWord = firstWordController.text;
    String secondWord = secondWordController.text;

    WordPair newWordPair = WordPair(firstWord, secondWord);

    // Update the original _randomWordPairs list using the provided callback function.
    updateWordPairs(newWordPair);

    Navigator.of(context).pop(); // Pop the current route to go back.
  }

  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add WordPair"),
      ),
      body: Form(
        child: Column(
          children: [
            TextField(
              controller: firstWordController,
              decoration: const InputDecoration(
                  labelText: 'First word', contentPadding: EdgeInsets.all(8.0)),
            ),
            TextField(
              controller: secondWordController,
              decoration: const InputDecoration(
                  labelText: 'Second word',
                  contentPadding: EdgeInsets.all(8.0)),
              onSubmitted: (_) => handleFormSubmission(),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 16), // Set the top margin value as desired
              child: ElevatedButton(
                onPressed: handleFormSubmission,
                child: const Text('Add WordPair'),
              ),
            ),
          ],
        ),
      ),
    );
  }));
}
