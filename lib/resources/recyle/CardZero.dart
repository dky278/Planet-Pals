import 'package:flutter/material.dart';

import 'recycle.dart';

class CardZero extends StatelessWidget {
  String? write;

  CardZero(this.write, {super.key});

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
                                  padding: const EdgeInsets.all(8.0),
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: const Text(
                                            "Organic waste recycling",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Center(
                                          child: Text(
                                            "(methods, steps, significance, barriers)",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 16),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Text(titles![0], textAlign: TextAlign.justify, style: TextStyle(
                                               fontSize: 16,),
                                          ),
                                        ),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 6,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(left: 20.0, right: 20,),
                                                child: ListTile(
                                                  leading: const Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                  ),
                                                  title: Text(
                                                    about_organowaste![index],
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
