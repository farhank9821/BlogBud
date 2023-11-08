import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BlogPost {
  final String blogTitle;
  final String blogTag;
  final String blogContent;
  final String username;
  final String uid;
  final String postId;
  final String postUrl;
  final String profileImg;
  final likes;
  final datePublished;

  BlogPost(
      {required this.blogTitle,
      required this.blogTag,
      required this.blogContent,
      required this.username,
      required this.uid,
      required this.postId,
      required this.postUrl,
      required this.profileImg,
      required this.likes,
      required this.datePublished});

  static BlogPost fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return BlogPost(
      blogTitle: snapshot['blogTitle'],
      blogTag: snapshot['blogTag'],
      blogContent: snapshot['blogContent'],
      username: snapshot['username'],
      uid: snapshot['uid'],
      postId: snapshot['postId'],
      postUrl: snapshot['postUrl'],
      profileImg: snapshot['profileImg'],
      likes: snapshot['likes'],
      datePublished: snapshot['datePublished'],
    );
  }

  Map<String, dynamic> toJson() => {
        'blogTitle': blogTitle,
        'blogTag': blogTag,
        'blogContent': blogContent,
        'username': username,
        'uid': uid,
        'postId': postId,
        'postUrl': postUrl,
        'profileImg': profileImg,
        'likes': likes,
        'datePublished': datePublished
      };
}
