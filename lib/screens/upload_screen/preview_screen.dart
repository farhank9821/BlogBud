import 'dart:typed_data';

import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  final Uint8List? image;
  final String title;
  final String tag;
  final String content;
  const PreviewScreen({
    super.key,
    required this.image,
    required this.title,
    required this.tag,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: const Text(
          'Preview',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: MemoryImage(image!),
                    fit: BoxFit.fill,
                    alignment: FractionalOffset.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(title),
              const SizedBox(
                height: 20,
              ),
              Text(tag),
              const SizedBox(
                height: 20,
              ),
              Text(content),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
