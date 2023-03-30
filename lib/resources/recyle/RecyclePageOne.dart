import 'package:flutter/material.dart';

import 'CardFive.dart';
import 'CardFour.dart';
import 'CardOne.dart';
import 'CardSix.dart';
import 'CardThree.dart';
import 'CardTwo.dart';
import 'CardZero.dart';

List<String> navigation = [];

class RecyclePageOne extends StatelessWidget {
  const RecyclePageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      // appBar: (PreferredSize(

          // preferredSize: Size.fromHeight(80))),
      body: SingleChildScrollView(
        child:
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Colors.orangeAccent,
                Color(0xFFBFF098   ),
                Color(0xFF6FD6FF ),
                // Color(0xFFE8F5C8),
                // Color(0xFFA9F1DF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
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
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Text('Recycle',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 24)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecycleCard("Organic waste recycling", 0, 'assets/recycle11.png'),
                    RecycleCard("Types of organic wastes ", 1, 'assets/types.png'),
                    RecycleCard("What is organic waste recycling?", 2, 'assets/what.png'),
                    RecycleCard("Methods of organic waste recycling", 3, 'assets/methods.png'),
                    RecycleCard("Process of organic  waste recycling", 4, 'assets/process.png'),
                    RecycleCard("Significance of organic waste recycling", 5, 'assets/significance.png'),
                    RecycleCard(
                        "Barriers and Challenges of organic waste recycling", 6, 'assets/ppg.png')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecycleCard extends StatelessWidget {
  String? write;
  int? indx;
  String image;

  RecycleCard(this.write, this.indx, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => indx == 0
                      ? CardZero(write)
                      : indx == 1
                          ? CardOne(write)
                          : indx == 2
                              ? CardTwo(write)
                              : indx == 3
                                  ? CardThree(write)
                                  : indx == 4
                                      ? CardFour(write)
                                      : indx == 5
                                          ? CardFive(write)
                                          : CardSix(write)));
        },
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFA9F1DF),
                    // Colors.orangeAccent,
                    Color(0xFFE8F5C8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.50,
                              child: Text(
                                write!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                child: Image.asset(
                              image,
                            )),
                          ),
                        ],
                      ),
                    )),
            ),
          ),
        ),
      ),
    );
  }
}
