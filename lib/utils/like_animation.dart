// import 'package:blog_bud/resources/firestore_methods.dart';
// import 'package:flutter/material.dart';

// class LikeAnimation extends StatefulWidget {
//   const LikeAnimation({super.key});

//   @override
//   State<LikeAnimation> createState() => _LikeAnimationState();
// }

// class _LikeAnimationState extends State<LikeAnimation> {
//   bool isLiked = false;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () async {
//         await FirestoreMethods().likes();
//         setState(() {
//           isLiked = !isLiked;
//         });
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: isLiked ? Colors.red : Colors.grey,
//         ),
//         child: const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Icon(
//             Icons.favorite,
//             color: Colors.white,
//             size: 24.0,
//           ),
//         ),
//       ),
//     );
//   }
// }
