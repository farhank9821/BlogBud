import 'dart:typed_data';
import 'package:blog_bud/models/blog_post.dart';
import 'package:blog_bud/resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadBlogPost(
    String blogTitle,
    String blogTag,
    String blogContent,
    Uint8List blogThumbnail,
    String uid,
    String username,
    String profilImg,
  ) async {
    String res = "some error occurred";

    try {
      String photoUrl = await StorageMethods().uploadImageToStorage(
        'BlogPosts',
        blogThumbnail,
        true,
      );
      String postId = const Uuid().v1();
      BlogPost post = BlogPost(
        blogTitle: blogTitle,
        blogTag: blogTag,
        blogContent: blogContent,
        username: username,
        uid: uid,
        postId: postId,
        postUrl: photoUrl,
        profileImg: profilImg,
        likes: [],
        datePublished: DateTime.now(),
      );

      _firestore.collection('post').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Likes updating
  Future<void> likes(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        _firestore.collection('post').doc(postId).update(
          {
            'likes': FieldValue.arrayRemove([uid]),
          },
        );
      } else {
        _firestore.collection('post').doc(postId).update(
          {
            'likes': FieldValue.arrayUnion([uid]),
          },
        );
      }
    } catch (err) {
      print(err.toString());
    }
  }
}
