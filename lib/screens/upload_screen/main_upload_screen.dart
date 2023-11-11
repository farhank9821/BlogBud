import 'dart:typed_data';
import 'package:blog_bud/models/user.dart';
import 'package:blog_bud/provider/user_provider.dart';
import 'package:blog_bud/resources/firestore_methods.dart';
import 'package:blog_bud/screens/upload_screen/preview_screen.dart';
import 'package:blog_bud/utils/utils.dart';
import 'package:blog_bud/widgets/custom_snack_bar.dart';
import 'package:blog_bud/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MainUpload extends StatefulWidget {
  const MainUpload({super.key});

  @override
  State<MainUpload> createState() => _MainUploadState();
}

class _MainUploadState extends State<MainUpload> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final TextEditingController _contextController = TextEditingController();
  Uint8List? _thumbnail;
  bool _isLoad = false;

  _selectImage(BuildContext parentContext, String title) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(title),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Take a photo for your blog'),
              onPressed: () async {
                Navigator.pop(context);
                Uint8List image = await pickImage(ImageSource.camera);
                setState(
                  () {
                    _thumbnail = image;
                  },
                );
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Take from gallery'),
              onPressed: () async {
                Navigator.pop(context);
                Uint8List image = await pickImage(ImageSource.gallery);
                setState(
                  () {
                    _thumbnail = image;
                  },
                );
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void clearImage() {
    setState(() {
      _thumbnail = null;
    });
  }

  void postImage(String uid, String username, String photoUrl) async {
    setState(() {
      _isLoad = true;
    });

    try {
      String res = await FirestoreMethods().uploadBlogPost(
        _titleController.text,
        _tagController.text,
        _contextController.text,
        _thumbnail!,
        uid,
        username,
        photoUrl,
      );
      if (res == 'success') {
        setState(() {
          _isLoad = false;
        });
        showSnackBar('Posted!', context);
        clearImage();
      } else {
        setState(() {
          _isLoad = false;
        });
        showSnackBar(res, context);
      }
    } catch (err) {
      setState(() {
        _isLoad = false;
      });
      showSnackBar(err.toString(), context);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _contextController.dispose();
    _tagController.dispose();
    _contextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return _thumbnail == null
        ? Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Want to create a blog ?',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: IconButton(
                        onPressed: () => _selectImage(context, 'Create a blog'),
                        icon: const Icon(
                          Icons.upload,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
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
              leading: IconButton(
                onPressed: clearImage,
                icon: const Icon(Icons.arrow_back_ios),
              ),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: () => postImage(
                    user.uid,
                    user.username,
                    user.photoUrl,
                  ),
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
                    _isLoad
                        ? const LinearProgressIndicator()
                        : const Padding(padding: EdgeInsets.only(top: 0)),
                    const Divider(),
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: MemoryImage(_thumbnail!),
                          fit: BoxFit.fill,
                          alignment: FractionalOffset.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () =>
                            _selectImage(context, "want to edit thumbnail ?"),
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
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PreviewScreen(
                              image: _thumbnail!,
                              title: _titleController.text,
                              tag: _tagController.text,
                              content: _contextController.text,
                            ),
                          ),
                        );
                      },
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
