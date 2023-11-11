import 'package:blog_bud/provider/like_button_provider.dart';
import 'package:blog_bud/resources/firestore_methods.dart';
import 'package:blog_bud/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FullLengthPost extends StatefulWidget {
  final String title;
  final String postUrl;
  final String profilepicUrl;
  final String date;
  final String username;
  final String content;
  final List likes;
  final String postId;
  final String uid;
  const FullLengthPost(
      {super.key,
      required this.title,
      required this.postUrl,
      required this.profilepicUrl,
      required this.username,
      required this.date,
      required this.content,
      required this.likes,
      required this.postId,
      required this.uid});

  @override
  State<FullLengthPost> createState() => _FullLengthPostState();
}

class _FullLengthPostState extends State<FullLengthPost> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    final likeButton = Provider.of<LikeButtonProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        actions: [
          InkWell(
            onTap: () async {
              await FirestoreMethods()
                  .likes(widget.postId, widget.uid, widget.likes);
              likeButton.toggleLike(widget.postId);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: likeButton.isPostLiked(widget.postId)
                    ? Colors.red
                    : Colors.grey,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.comment),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Text(
                widget.title,
                style: Styles.headLineStyle1,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage(widget.postUrl),
                    fit: BoxFit.fill,
                    alignment: FractionalOffset.topCenter,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 27,
                          backgroundImage: NetworkImage(
                            widget.profilepicUrl,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.username,
                              style: Styles.headLineStyle2,
                            ),
                            Text(
                              widget.date,
                              style: Styles.headLineStyle3,
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Text(widget.content),
              )
            ],
          ),
        ),
      ),
    );
  }
}
