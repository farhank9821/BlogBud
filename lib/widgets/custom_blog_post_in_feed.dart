import 'package:blog_bud/models/user.dart';
import 'package:blog_bud/provider/user_provider.dart';
import 'package:blog_bud/utils/app_styles.dart';
import 'package:blog_bud/widgets/custom_full_length_post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BlogPostInFeed extends StatelessWidget {
  final snap;
  const BlogPostInFeed({super.key, required this.snap});

  String _getFirst5Words(String blogContent) {
    List<String> words = blogContent.split(' ');
    if (words.length > 5) {
      return '${words.sublist(0, 5).join(' ')}...';
    } else {
      return blogContent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: 429,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 27,
                        backgroundImage: NetworkImage(
                          snap['profileImg'],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snap['username'],
                            style: Styles.headLineStyle2,
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(snap['datePublished'].toDate()),
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
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullLengthPost(
                      title: snap['blogTitle'],
                      postUrl: snap['postUrl'],
                      profilepicUrl: snap['profileImg'],
                      username: snap['username'],
                      date: DateFormat.yMMMd().format(
                        snap['datePublished'].toDate(),
                      ),
                      content: snap['blogContent'],
                      postId: snap['postId'],
                      uid: user.uid,
                      likes: snap['likes'],
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(
                          snap['postUrl'],
                        ),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),
                  ),
                  Text(
                    snap['blogTitle'],
                    style: Styles.headLineStyle1,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    _getFirst5Words(snap['blogContent']),
                    style: Styles.headLineStyle2,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'X views',
                        style: Styles.headLineStyle3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${snap['likes'].length} likes',
                            style: Styles.headLineStyle3,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            ' Z comments',
                            style: Styles.headLineStyle3,
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    '# ${snap['blogTag']}',
                    style: Styles.headLineStyle3.copyWith(color: Colors.red),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border_outlined,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
