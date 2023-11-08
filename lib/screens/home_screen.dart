import 'package:blog_bud/models/user.dart';
import 'package:blog_bud/provider/user_provider.dart';
import 'package:blog_bud/resources/auth_methods.dart';
import 'package:blog_bud/widgets/custom_blog_post_in_feed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          user.username,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              user.photoUrl,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
            // onPressed: () async {
            //   showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return AlertDialog(
            //         title: Row(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Image.network(
            //                 'https://previews.123rf.com/images/tmricons/tmricons1707/tmricons170700613/81207214-logout-sign-icon-sign-out-button.jpg',
            //                 height: 20,
            //                 width: 20,
            //               ),
            //             ),
            //             const Padding(
            //               padding: EdgeInsets.all(8.0),
            //               child: Text("Log Out"),
            //             ),
            //           ],
            //         ),
            //         content: const Text('Do you wanna Log out ?'),
            //         actions: [
            //           TextButton(
            //             onPressed: () async {
            //               Navigator.pop(context);
            //             },
            //             child: const Text('Cancel'),
            //           ),
            //           TextButton(
            //             onPressed: () async {
            //               AuthMethods()
            //                   .logOutUser()
            //                   .then((value) => Navigator.pop(context));
            //             },
            //             child: const Text('Ok'),
            //           )
            //         ],
            //       );
            //     },
            //   );
            // },
          )
        ],
        centerTitle: false,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('post').snapshots(),
        builder: ((context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => BlogPostInFeed(
              snap: snapshot.data!.docs[index].data(),
            ),
            itemCount: snapshot.data!.docs.length,
          );
        }),
      ),
    );
  }
}
