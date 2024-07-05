import 'package:flutter/material.dart';
import 'package:myapp/src/Widget/pages/Card_detailes_pg/text_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyCard extends StatelessWidget {
  MyCard({
    super.key,
    required this.imagePath,
    required this.urlLink,
    required this.name,
  });
  final String imagePath;
  final String urlLink;
  final String name;
  final Changetxt changetxt = Changetxt();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 250,
      child: Card(
        elevation: 20,
        color: Colors.white,
        child: Column(
          children: [
            Image(
              alignment: Alignment.topCenter,
              image: AssetImage(
                imagePath,
              ),
            ),
            // const SizedBox(
            //   height: 6,
            // ),
            Row(
              //  mainAxisAlignment: ,
              children: [
                const SizedBox(
                  // height: 10,
                  width: 5,
                ),
                TextButton(
                    onPressed: () {
                      if (name.toLowerCase() == "github" ||
                          name.toLowerCase() == "linkedin") {
                        launchUrlString(urlLink);
                      } else {
                        launchUrlString("tel:$urlLink");
                      }
                    },
                    child: ListenableBuilder(
                        listenable: changetxt,
                        builder: (context, snapshot) {
                          if (name.toLowerCase() == "linkedin" ||
                              name.toLowerCase() == "github") {
                            changetxt.makeChange();
                          }
                          return changetxt.what
                              ? Text(
                                  "Click to visit $name >",
                                  style: const TextStyle(color: Colors.blue),
                                )
                              : Text(
                                  "Click to $name >",
                                  style: const TextStyle(color: Colors.blue),
                                );
                        })),
              ],
            )
          ],
        ),
      ),

      ///
      ///tried gridview
      ///
      ///

      // SizedBox(
      //   height: 180,
      //   width: 250,
      //   child: ListView(children: [
      //     GridView.count(
      //       crossAxisCount: 2,
      //       children: [
      //         for (int i = 0; i < link.length; i++) ...[
      //           Card(
      //             elevation: 20,
      //             color: Colors.white,
      //             child: Column(
      //               children: [
      //                 Image(
      //                   alignment: Alignment.topCenter,
      //                   image: AssetImage(
      //                     image[i],
      //                   ),
      //                 ),
      //                 // const SizedBox(
      //                 //   height: 6,
      //                 // ),
      //                 Row(
      //                   //  mainAxisAlignment: ,
      //                   children: [
      //                     const SizedBox(
      //                       // height: 10,
      //                       width: 5,
      //                     ),
      //                     TextButton(
      //                       onPressed: () {
      //                         launchUrlString(link[i]);
      //                       },
      //                       child: const Text(
      //                         "Click here to visit >",
      //                         style: TextStyle(color: Colors.blue),
      //                       ),
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ),
      //         ]
      //       ],
      //     ),
      //   ]),
      // )
    );
  }
}
