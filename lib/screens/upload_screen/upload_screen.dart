import 'dart:typed_data';

import 'package:blog_bud/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

// was initially working on this screen, but then created a new file and shifted there
// will come here in needed to try something
class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final TextEditingController _contextController = TextEditingController();
  Uint8List? _thumbnail;

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: const Text(
          'Post Blog',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Post",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ).copyWith(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                height: 220,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {},
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX8OzlaoBiGKmWUSFPEV2sPwlwvwXcJGgSP8PBdiwhfg&s',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                hintText: "Enter Title",
                controller: _titleController,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _tagController,
                decoration: InputDecoration(
                  border: inputBorder,
                  focusedBorder: inputBorder,
                  enabledBorder: inputBorder,
                  filled: true,
                  contentPadding: const EdgeInsets.all(8),
                  hintText: 'Enter Tag',
                ),
                keyboardType: TextInputType.text,
                maxLength: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _contextController,
                decoration: InputDecoration(
                    border: inputBorder,
                    focusedBorder: inputBorder,
                    enabledBorder: inputBorder,
                    filled: true,
                    contentPadding: const EdgeInsets.all(8),
                    hintText: 'Start writing from here....'),
                keyboardType: TextInputType.text,
                // maxLength: 10,
                maxLines: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Color(0xFF3F2305),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text(
                      'Preview',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
