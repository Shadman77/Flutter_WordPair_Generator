import 'package:flutter/material.dart';

void addWordPair(context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add WordPair"),
      ),
      body: const Form(child: TextField()),
    );
  }));
}
