import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

late List _para= [];
List _descr = [
  "Containers can be reused at home or for school projects.",
  "Reuse wrapping paper, plastic bags, boxes, and lumber.",
  "Give outgrown clothing to friends or charity.",
  "Buy beverages in returnable containers.",
  "Donate broken appliances to charity or a local vocational school, which can use them for art classes or for students to practice repairing.",
  "Offer furniture and household items that are no longer needed to people in need, friends, or charity.",
  "Sheets of paper that have been used on only one side can be used for note-taking or rough drafts.",
  "Old, outdated furniture can be reupholstered or slipcovered. Have padding added to the furniture to give it a new look. Often the frame can be modified slightly to change the way it looks.",
  "Old towels and sheets can be cut in small pieces and used for dust cloths.",
  "Books and magazines can be donated to schools, public libraries, or nursing homes.",
  "Newspapers can be donated to pet stores.",
  "Packing materials, such as polystyrene, plastic quilting, and similar materials, can be saved and reused again for packing.",
  "Carry a reusable tote bag or take bags to the store when you go shopping. There are attractive nylon mesh bags available that can be stored easily in the glove compartment of your car. Durable canvas bags, which take very little space to tuck away when not in use, can also be used.",
  "If you buy prepared microwaveable dinners, save the plates for outdoor parties or for children.",
  "Old tires can be used in the garden and in the play yard.",
];
// Row(
// children: const [
// Expanded(
// child: FittedBox(
// child: Text(
// 'It is a long established text.',
// style: TextStyle(fontSize: 58),
// softWrap: false,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// ),
// ],
// )

// Future<void> getData() async {
//   var _url = Uri.parse("https://pubs.nmsu.edu/_g/G314/index.html");
//   var _response = await http.get(_url);
//   dom.Document _html = dom.Document.html(_response.body);
//   _para = _html
//       .querySelectorAll('#content > article > p')
//       .map((e) => e.innerHtml.trim())
//       .toList();
// }

class Reuse extends StatelessWidget {
  const Reuse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child : Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // Colors.orangeAccent,
                  // Color(0xFFBFF098   ),
                  // Color(0xFF6FD6FF ),
                  Color(0xFFA9F1DF),
                  Color(0xFFE8F5C8),

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
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 18.0),
                          child: Text('Reuse',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 24)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),


                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Text(
                    //       "Reuse",
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, fontSize: 20),
                    //     ),
                    //   ),
                    // ),
              Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Text("The idea of being wasteful makes many people uncomfortable. Yet most of us continue to waste because we can't think of anything better to do with last year's phone book, draperies that are too short, or a closet door that was scratched by a favorite pet. We are conditioned to think of things that are old, empty, worn, broken, ugly, or marred as useless, so we throw them away without much thought about the consequences. Most Americans buy far more than they can use effectively, as evidenced by bulging attics and garages.", textAlign: TextAlign.justify,),
                          SizedBox(height: 15,),
                          Text("The process of reusing starts with the assumption that the used materials that flow through our lives can be a resource rather than refuse. Waste, after all, is in the eye of the beholder. One person's trash is another person's treasure. If we really look at things we are throwing away, we can learn to see them as materials that can be reused to solve everyday problems and satisfy everyday needs. Most of us, however, haven't even begun to exploit the resources in our trash. Once you have made up your mind to use trash for positive uses, you can begin to brainstorm and generate ideas. Reusing saves money, conserves resources, and satisfies the human urge to be creative.", textAlign: TextAlign.justify,),
                        ],
                      ),
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Reuse: What Can We Do?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "The following are some examples of reuse.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SizedBox(
                        height: 750,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 15,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                '${index + 1}). ${_descr[index].toString()}', textAlign: TextAlign.justify,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )

              ),
            );

  }
}