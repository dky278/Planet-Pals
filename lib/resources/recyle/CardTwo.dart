import 'package:flutter/material.dart';

import 'recycle.dart';

class CardTwo extends StatelessWidget {
  String? write;

  CardTwo(this.write, {super.key});

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
                child: Column(children: [
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
                          return SingleChildScrollView(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Text(
                                              "What is organic waste recycling?",
                                                style: TextStyle(
                                                    color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold)),
                                        ),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 9,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                                child: ListTile(
                                                  leading: const Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                  ),
                                                  title: Text(
                                                    about_organowaste![
                                                        index + 13],
                                                    textAlign: TextAlign.justify,
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ])));
                        } else if (snapshot.connectionState ==
                            ConnectionState.none) {
                          return Container();
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ]))));
  }
}
