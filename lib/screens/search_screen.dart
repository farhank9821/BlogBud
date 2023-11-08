import 'package:blog_bud/resources/auth_methods.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://previews.123rf.com/images/tmricons/tmricons1707/tmricons170700613/81207214-logout-sign-icon-sign-out-button.jpg',
                            height: 20,
                            width: 20,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Log Out"),
                        ),
                      ],
                    ),
                    content: const Text('Do you wanna Log out ?'),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          AuthMethods()
                              .logOutUser()
                              .then((value) => Navigator.pop(context));
                        },
                        child: const Text('Ok'),
                      )
                    ],
                  );
                },
              );
            },
          ),
          Center(
            child: Text('Search Screen'),
          ),
        ],
      ),
    );
  }
}
