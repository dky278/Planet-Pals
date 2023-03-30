import 'package:flutter/material.dart';
import 'recycle.dart';

class CardThree extends StatelessWidget {
  String? write;

  CardThree(this.write, {super.key});

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
                                 Text(' Recycle',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
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
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                            "https://microbenotes.com/wp-content/uploads/2020/11/Organic-waste-recycling.jpeg"),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        TextWidget(
                                            "Methods of organic waste recycling"),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Text(
                                          "There are different methods of organic waste recycling, each of which can be used for a particular group of waste to produce some form of useful organic matter. ",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(fontSize: 16),),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Text(
                                            "Some of the common methods are described below:-", textAlign: TextAlign.justify,
                                          style: TextStyle(fontSize: 16),),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        TextWidget("1. Animal feed"),
                                        ListBuilder(about_organowaste!, 23, 7),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        TextWidget("2. Composting"),
                                        ListBuilder(about_organowaste, 30, 8),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        TextWidget("3. Anaerobic digestion"),
                                        ListBuilder(about_organowaste, 38, 5),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        TextWidget("4. Rendering"),
                                        ListBuilder(about_organowaste, 43, 6),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        TextWidget(
                                            "5. Rapid thermophilic digestion"),
                                        ListBuilder(about_organowaste, 51, 4),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        TextWidget(
                                            "6. Immobilized enzyme reaction"),
                                        ListBuilder(about_organowaste, 55, 8),
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
