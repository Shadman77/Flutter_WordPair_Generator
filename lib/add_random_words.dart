import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void addWordPair(BuildContext context, Function(WordPair) updateWordPairs) {
  TextEditingController textEditingController = TextEditingController();

  void handleFormSubmission() {
    String inputText = textEditingController.text;
    WordPair newWordPair = WordPair(inputText, '.');

    // Update the original _randomWordPairs list using the provided callback function.
    updateWordPairs(
      newWordPair,
    );

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
              controller: textEditingController,
              onSubmitted: (_) => handleFormSubmission(),
            ),
            ElevatedButton(
              onPressed: handleFormSubmission,
              child: const Text('Add WordPair'),
            ),
          ],
        ),
      ),
    );
  }));
}
