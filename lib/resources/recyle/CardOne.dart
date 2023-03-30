import 'package:flutter/material.dart';
import 'recycle.dart';

class CardOne extends StatefulWidget {
  String? write;

  CardOne(this.write, {super.key});

  @override
  State<CardOne> createState() => _CardOneState();
}

class _CardOneState extends State<CardOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Colors.orangeAccent,
                Color(0xFFA9F1DF),
                // Colors.orangeAccent,
                Color(0xFFE8F5C8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(' Recycle',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                  future: getRecycleData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              left: 35.0, right: 35, bottom: 35),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Organic wastes have been an important source of pollution in the environment.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextWidget(
                                  "Some of the common types of organic wastes usually found in nature include the following:-",
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextWidget(
                                  titles![1],
                                ),
                                ListBuilder(about_organowaste!, 6, 2),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextWidget(titles![2]),
                                ListBuilder(about_organowaste!, 8, 3),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextWidget(
                                  titles![3],
                                ),
                                ListBuilder(about_organowaste!, 11, 3),
                              ]));
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return Container();
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
