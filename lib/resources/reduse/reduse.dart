import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

late List _title;
late List _descr;
String? items;

Future<void> getData() async {
  var _url = Uri.parse(
    "https://www.nature.org/en-us/about-us/where-we-work/united-states/delaware/stories-in-delaware/delaware-eight-ways-to-reduce-waste/"
  );
  var _response = await http.get(_url);
  dom.Document _html = dom.Document.html(_response.body);
  _title = _html
      .querySelectorAll('#body_rich_text_editor > div > h3')
      .map((e) => e.innerHtml.trim())
      .toList();
  _descr = _html
      .querySelectorAll('#body_rich_text_editor > div > p')
      .map((e) => e.innerHtml.trim())
      .toList();
}
class Reduce extends StatelessWidget {
  const Reduce({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                            itemCount: _title.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                              child: Card(
                                elevation: 10,
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    gradient: LinearGradient(
                                      colors: [
                                        // Colors.orangeAccent,
                                        // Color(0xFFBFF098   ),
                                        //
                                        Color(0xFFA9F1DF),
                                        Color(0xFFE8F5C8),
                                        // Color(0xFFA9F1DF),

                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                                Text(_title[index],
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                                SizedBox(height: 20,),
                                                Text(_descr[index]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                    ),

                  ],
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Text("Something Went Wrong");
          }
        },
      ),
    );
  }
}
