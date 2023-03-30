import 'package:flutter/material.dart';
import 'package:untitled4/Input_page.dart';
import 'package:untitled4/drawer.dart';
import 'package:untitled4/home_screen.dart';
import 'package:untitled4/news/news.dart';
import 'package:untitled4/resources/recyle/RecyclePageOne.dart';

import 'resources/reduse/reduse.dart';
import 'resources/resuse/resuse.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 40, bottom: 400),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 58.0, bottom: 50),
              child: Text(
                'Planet Pals',
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: <Widget>[
                NewRow(
                  text: ' CO2 Calc',
                  icon: Icons.calculate_outlined,
                  function: Input_page(),
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  text: 'Recycle',
                  icon: Icons.replay_circle_filled_rounded,
                  function: RecyclePageOne(),
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  text: 'Reuse',
                  icon: Icons.recycling_sharp,
                  function: Reuse(),
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  text: 'Reduce',
                  icon: Icons.reduce_capacity_rounded,
                  function: Reduce(),
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  text: 'News',
                  icon: Icons.newspaper,
                  function: News(),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final function;

  const NewRow({
    Key? key,
    required this.icon,
    required this.text, this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    function));
          },
          child: Text(
            text,
            style: TextStyle(color: Colors.white54),
          ),
        )
      ],
    );
  }
}
