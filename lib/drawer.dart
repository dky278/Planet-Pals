//
//
// import 'package:flutter/material.dart';
//
// import 'news/news.dart';
// import 'resources/first.dart';
//
// class drawwer extends StatelessWidget {
//   const drawwer({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           ListTile(title: Text("News"), onTap: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) =>
//                 News()
//             ));
//           },),
//           ListTile(title: Text("R.R.R."), onTap: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) =>
//                 First()
//             ));
//           },),
//         ],
//       ),
//     );
//   }
// }