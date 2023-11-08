import 'package:blog_bud/utils/app_styles.dart';
import 'package:flutter/material.dart';

class FullLengthPost extends StatefulWidget {
  final String title;
  final String postUrl;
  final String profilepicUrl;
  final String date;
  final String username;
  final String content;
  const FullLengthPost({
    super.key,
    required this.title,
    required this.postUrl,
    required this.profilepicUrl,
    required this.username,
    required this.date,
    required this.content,
  });

  @override
  State<FullLengthPost> createState() => _FullLengthPostState();
}

class _FullLengthPostState extends State<FullLengthPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
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
