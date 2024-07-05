import 'package:flutter/material.dart';
import 'package:myapp/src/BLoC_Db/logic.dart';
import 'package:myapp/src/Widget/pages/Card_detailes_pg/mycard.dart';
import 'package:myapp/src/Widget/pages/Card_detailes_pg/item_list.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});
  final getdb = Db();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Details Page"),
            centerTitle: true,
            flexibleSpace: SizedBox(
              height: 500,
            ),
            //leading:
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.account_circle,
                  size: 100,
                ),
                // SizedBox(
                //   width: 500,
                // ),
                const Center(child: Text("Name")),
                const Center(child: Text("Number")),
                const SizedBox(
                  height: 20,
                ),
                //this is cards in row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < link.length; i++) ...[
                      MyCard(
                        imagePath: image[i],
                        urlLink: link[i],
                        name: name[i],
                      ),
                    ]
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
