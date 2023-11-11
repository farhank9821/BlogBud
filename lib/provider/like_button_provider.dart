import 'package:flutter/material.dart';

class LikeButtonProvider extends ChangeNotifier {
  Set<String> _likedPostIds = {};

  bool isPostLiked(String postId) {
    return _likedPostIds.contains(postId);
  }

  void toggleLike(String postId) {
    if (_likedPostIds.contains(postId)) {
      _likedPostIds.remove(postId);
    } else {
      _likedPostIds.add(postId);
    }

    notifyListeners();
  }
}
