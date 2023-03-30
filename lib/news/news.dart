import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../drawer.dart';
import 'newsCard.dart';

class News extends StatefulWidget {
  News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> with TickerProviderStateMixin {
  List? titlee;

  var apikeyy = 'pub_19131a08b40c9c2bdf8766de2a85d1d82fa4f';
  var url1, url2, url3;

  var data1, data2, data3;

  getNews() async {
    url1 =
        "https://newsdata.io/api/1/news?apikey=$apikeyy&language=en&category=environment ";
    url2 =
        "https://newsdata.io/api/1/news?apikey=$apikeyy&q=environment%20OR%20temperature%20OR%20trees%20OR%20global%20warming&language=en&category=environment ";
    url3 =
        "https://newsdata.io/api/1/news?apikey=$apikeyy&q=climate&language=en&category=environment ";

    var res1 = await http.get(Uri.parse(url1));
    data1 = jsonDecode(res1.body);

    var res2 = await http.get(Uri.parse(url2));
    data2 = jsonDecode(res2.body);

    var res3 = await http.get(Uri.parse(url3));
    data3 = jsonDecode(res3.body);
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor:  Color(0xFF6FD6FF ),
            bottom: TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text("Top", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  Text("Environment", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  Text("Climate", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ]),
            title: const Text(
              "Environment in the News",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(

              gradient: LinearGradient(
                colors: [
                  // Colors.orangeAccent,
                  Color(0xFF6FD6FF ),
                  Color(0xFFBFF098   ),

                  // Color(0xFFE8F5C8),
                  // Color(0xFFA9F1DF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: FutureBuilder(
                future: getNews(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: data1['results'].length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 100,
                            child:
                                TabBarView(controller: _tabController, children: [
                              // Top(titlee![index]),
                              Top(
                                data1['results'][index]['title'].toString(),
                                data1['results'][index]['image_url'].toString(),
                                data1['results'][index]['creator'] == null
                                    ? "Unkown"
                                    : data1['results'][index]['creator'][0]
                                        .toString(),
                                data1['results'][index]['pubDate'].toString(),
                                index,
                              ),
                              Top(
                                data2['results'][index]['title'].toString(),
                                data2['results'][index]['image_url'].toString(),
                                data2['results'][index]['creator'] == null
                                    ? "Unkown"
                                    : data2['results'][index]['creator'][0]
                                        .toString(),
                                data2['results'][index]['pubDate'].toString(),
                                index,
                              ),
                              Top(
                                data3['results'][index]['title'].toString(),
                                data3['results'][index]['image_url'].toString(),
                                data3['results'][index]['creator'] == null
                                    ? "Unkown"
                                    : data3['results'][index]['creator'][0]
                                        .toString(),
                                data3['results'][index]['pubDate'].toString(),
                                index,
                              ),
                            ]),
                          );
                        });
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ));
  }
}
