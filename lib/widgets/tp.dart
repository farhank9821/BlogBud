// import 'package:flutter/material.dart';

// class name extends StatelessWidget {
//   const name({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(7.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   CircleAvatar(
//                     radius: 27,
//                     backgroundImage: NetworkImage(
//                       snap['profileImg'],
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 15,
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         snap['username'],
//                         style: Styles.headLineStyle2,
//                       ),
//                       Text(
//                         DateFormat.yMMMd()
//                             .format(snap['datePublished'].toDate()),
//                         style: Styles.headLineStyle3,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.more_vert),
//               ),
//             ],
//           ),
//         ),
//         Column(
//           children: [
//             Container(
//               height: 200,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     snap['postUrl'],
//                   ),
//                   fit: BoxFit.fill,
//                   alignment: FractionalOffset.topCenter,
//                 ),
//               ),
//             ),
//             Text(
//               snap['blogTitle'],
//               style: Styles.headLineStyle1,
//             ),
//             const SizedBox(
//               height: 7,
//             ),
//             Text(
//               _getFirst5Words(snap['blogContent']),
//               style: Styles.headLineStyle2,
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 7,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     'X views',
//                     style: Styles.headLineStyle3,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         '${snap['likes'].length} likes',
//                         style: Styles.headLineStyle3,
//                       ),
//                       const SizedBox(
//                         width: 3,
//                       ),
//                       Text(
//                         ' Z comments',
//                         style: Styles.headLineStyle3,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               Text(
//                 '# ${snap['blogTag']}',
//                 style: Styles.headLineStyle3.copyWith(color: Colors.red),
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.bookmark_border_outlined,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const Divider(
//           thickness: 1,
//           color: Colors.grey,
//         ),
//       ],
//     );
//   }
// }




// Container(
//       color: Colors.amber,
//       width: double.infinity,
//       height: 440,
//       child: Padding(
//         padding: const EdgeInsets.only(
//           top: 10,
//         ),
//         child: Column(
//           children: [
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(7.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           CircleAvatar(
//                             radius: 27,
//                             backgroundImage: NetworkImage(
//                               snap['profileImg'],
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 15,
//                           ),
//                           Column(
//                             children: [
//                               Text(
//                                 snap['username'],
//                                 style: Styles.headLineStyle2,
//                               ),
//                               Text(
//                                 DateFormat.yMMMd()
//                                     .format(snap['datePublished'].toDate()),
//                                 style: Styles.headLineStyle3,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.more_vert),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     image: DecorationImage(
//                       image: NetworkImage(
//                         snap['postUrl'],
//                       ),
//                       fit: BoxFit.fill,
//                       alignment: FractionalOffset.topCenter,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   snap['blogTitle'],
//                   style: Styles.headLineStyle1,
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 Text(
//                   _getFirst5Words(snap['blogContent']),
//                   style: Styles.headLineStyle2,
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             'X views',
//                             style: Styles.headLineStyle3,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 '${snap['likes'].length} likes',
//                                 style: Styles.headLineStyle3,
//                               ),
//                               const SizedBox(
//                                 width: 3,
//                               ),
//                               Text(
//                                 ' Z comments',
//                                 style: Styles.headLineStyle3,
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       Text(
//                         '# ${snap['blogTag']}',
//                         style:
//                             Styles.headLineStyle3.copyWith(color: Colors.red),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(
//                           Icons.bookmark_border_outlined,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Divider(
//                   thickness: 1,
//                   color: Colors.grey,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );